//+------------------------------------------------------------------+
//|                                                        hedge.mq5 |
//|                                  Copyright 2025, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade\Trade.mqh>

CTrade trade; 

int OnInit()
  {

   

   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {

   
  }

void OnTick()
  {
GetOpenTradesInfo();
  }

void OnTrade()
  {

   
  }


void OpenTrade(double volume,double price_open, double sl, double tp, ENUM_POSITION_TYPE type)
{
   double lot_size = volume; 
   double stop_loss = 50; 
   double take_profit = 100; 
   double price = SymbolInfoDouble(_Symbol, SYMBOL_BID); 
//    sl = price - stop_loss * _Point; 
//    tp = price + take_profit * _Point; 

  
   if(trade.PositionOpen(_Symbol,(type == POSITION_TYPE_BUY ? ORDER_TYPE_BUY : ORDER_TYPE_SELL), lot_size, price, sl, tp))
   {
      Print("Trade opened successfully");
   }
   else
   {
      Print("Trade opening failed: ", trade.ResultRetcode());
   }
}

void GetOpenTradesInfo()
{
   int total_positions = PositionsTotal();
   Print("Total open positions: ", total_positions);
   
   for(int i = 0; i < total_positions; i++)
   {
      ulong ticket = PositionGetTicket(i);
      string symbol = PositionGetString(POSITION_SYMBOL);
      if(symbol==_Symbol)
        {
          double volume = PositionGetDouble(POSITION_VOLUME);
      double price_open = PositionGetDouble(POSITION_PRICE_OPEN);
      double sl = PositionGetDouble(POSITION_SL);
      double tp = PositionGetDouble(POSITION_TP);
      ENUM_POSITION_TYPE type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      PrintFormat("Ticket: %d, Symbol: %s, Type: %s, Volume: %.2f, Open Price: %.5f, SL: %.5f, TP: %.5f",
                  ticket, symbol, (type == POSITION_TYPE_BUY ? "BUY" : "SELL"), volume, price_open, sl, tp);
                  OpenTrade(volume,price_open,sl,tp,type);
        }
        else{
     Print("this Pair does not have any open positions");
     }
      
      
   }
}
