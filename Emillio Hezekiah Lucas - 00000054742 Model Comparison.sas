/*---------------------------------------------------------
  The options statement below should be placed
  before the data step when submitting this code.
---------------------------------------------------------*/
options VALIDMEMNAME=EXTEND VALIDVARNAME=ANY;
   /*------------------------------------------
   Generated SAS Scoring Code
     Date             : 12Jun2023:09:29:17
     Locale           : en_US
     Model Type       : Linear Regression
     Interval variable: sales
     Interval variable: Quantity
     Interval variable: UnitPrice
     Class variable   : tipe
     Class variable   : Country
     Response variable: sales
     ------------------------------------------*/
   /*---------------------------------------------------------
     Generated SAS Scoring Code
     Date: 12Jun2023:09:29:17
     -------------------------------------------------------*/

   /*---------------------------------------------------------
   Defining temporary arrays and variables   
     -------------------------------------------------------*/
   drop _badval_ _linp_ _temp_ _i_ _j_;
   _badval_ = 0;
   _linp_   = 0;
   _temp_   = 0;
   _i_      = 0;
   _j_      = 0;

   array _xrow_11439_0_{42} _temporary_;
   array _beta_11439_0_{42} _temporary_ (    16.5924396674957
          -26.4803145577505
          -9.54048888461044
                          0
           37.4825923677915
           8.61152487895629
           6.23584210303329
           3.84709914720584
           15.5099129243846
           0.91543583658182
           7.74784365288674
           2.27570390867644
           15.4722814106165
           33.0231435518509
            13.963289025158
           4.08127137037332
           9.12681970084162
           7.57495047848476
             8.635233358183
           19.1937362967871
           6.07389903408336
           11.4898115538488
           5.31213442186054
           20.3746629190735
           16.6949708477128
           24.1927866440507
           5.08110274712909
           31.0450646083926
           9.04983421131398
           6.67839482395998
           6.46396559162429
           6.38212439600835
           6.36940034950575
            8.6567887139381
            -0.990001306214
           11.3859639705634
           4.70113513190999
           10.2788203633464
            6.1423130404604
                          0
           1.04716643664906
           1.22585712777562);

   length _Country_ $14; drop _Country_;
   _Country_ = left(trim(put(Country,$14.)));
   length _tipe_ $12; drop _tipe_;
   _tipe_ = left(trim(put(tipe,BEST.)));
   /*------------------------------------------*/
   /*Missing values in model variables result  */
   /*in missing values for the prediction.     */
   if missing(Quantity) 
      or missing(UnitPrice) 
      then do;
         _badval_ = 1;
         goto skip_11439_0;
   end;
   /*------------------------------------------*/

   do _i_=1 to 42; _xrow_11439_0_{_i_} = 0; end;

   _xrow_11439_0_[1] = 1;

   _temp_ = 1;
   select (_tipe_);
      when ('1') _xrow_11439_0_[2] = _temp_;
      when ('2') _xrow_11439_0_[3] = _temp_;
      when ('3') _xrow_11439_0_[4] = _temp_;
      otherwise do; _badval_ = 1; goto skip_11439_0; end;
   end;

   _temp_ = 1;
   select (_Country_);
      when ('Australia') _xrow_11439_0_[5] = _temp_;
      when ('Austria') _xrow_11439_0_[6] = _temp_;
      when ('Bahrain') _xrow_11439_0_[7] = _temp_;
      when ('Belgium') _xrow_11439_0_[8] = _temp_;
      when ('Brazil') _xrow_11439_0_[9] = _temp_;
      when ('Canada') _xrow_11439_0_[10] = _temp_;
      when ('Channel Island') _xrow_11439_0_[11] = _temp_;
      when ('Cyprus') _xrow_11439_0_[12] = _temp_;
      when ('Czech Republic') _xrow_11439_0_[13] = _temp_;
      when ('Denmark') _xrow_11439_0_[14] = _temp_;
      when ('EIRE') _xrow_11439_0_[15] = _temp_;
      when ('European Commu') _xrow_11439_0_[16] = _temp_;
      when ('Finland') _xrow_11439_0_[17] = _temp_;
      when ('France') _xrow_11439_0_[18] = _temp_;
      when ('Germany') _xrow_11439_0_[19] = _temp_;
      when ('Greece') _xrow_11439_0_[20] = _temp_;
      when ('Iceland') _xrow_11439_0_[21] = _temp_;
      when ('Israel') _xrow_11439_0_[22] = _temp_;
      when ('Italy') _xrow_11439_0_[23] = _temp_;
      when ('Japan') _xrow_11439_0_[24] = _temp_;
      when ('Lebanon') _xrow_11439_0_[25] = _temp_;
      when ('Lithuania') _xrow_11439_0_[26] = _temp_;
      when ('Malta') _xrow_11439_0_[27] = _temp_;
      when ('Netherlands') _xrow_11439_0_[28] = _temp_;
      when ('Norway') _xrow_11439_0_[29] = _temp_;
      when ('Poland') _xrow_11439_0_[30] = _temp_;
      when ('Portugal') _xrow_11439_0_[31] = _temp_;
      when ('Saudi Arabia') _xrow_11439_0_[32] = _temp_;
      when ('Singapore') _xrow_11439_0_[33] = _temp_;
      when ('Spain') _xrow_11439_0_[34] = _temp_;
      when ('Sweden') _xrow_11439_0_[35] = _temp_;
      when ('Switzerland') _xrow_11439_0_[36] = _temp_;
      when ('USA') _xrow_11439_0_[37] = _temp_;
      when ('United Arab Em') _xrow_11439_0_[38] = _temp_;
      when ('United Kingdom') _xrow_11439_0_[39] = _temp_;
      when ('Unspecified') _xrow_11439_0_[40] = _temp_;
      otherwise do; _badval_ = 1; goto skip_11439_0; end;
   end;

   _xrow_11439_0_[41] = Quantity;

   _xrow_11439_0_[42] = UnitPrice;

   do _i_=1 to 42;
      _linp_ + _xrow_11439_0_{_i_} * _beta_11439_0_{_i_};
   end;

   skip_11439_0:
   label P_sales = 'Predicted: sales';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      P_sales = _linp_;
   end; else do;
      _linp_ = .;
      P_sales = .;
   end;
   /*------------------------------------------*/
   /*_VA_DROP*/ drop 'P_sales'n;
      'P_sales_11439'n='P_sales'n;
   /*------------------------------------------*/