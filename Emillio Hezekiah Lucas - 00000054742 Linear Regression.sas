/*---------------------------------------------------------
  The options statement below should be placed
  before the data step when submitting this code.
---------------------------------------------------------*/
options VALIDMEMNAME=EXTEND VALIDVARNAME=ANY;
   /*------------------------------------------
   Generated SAS Scoring Code
     Date             : 15Jun2023:07:03:48
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
     Date: 15Jun2023:07:03:47
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

   array _xrow_6366_0_{42} _temporary_;
   array _beta_6366_0_{42} _temporary_ (       16.5924396672
          -26.4803145577505
          -9.54048888461045
                          0
           37.4825923680872
           8.61152487925206
           6.23584210332903
            3.8470991475016
           15.5099129246804
           0.91543583687759
            7.7478436531825
           2.27570390897219
           15.4722814109122
           33.0231435521467
           13.9632890254538
           4.08127137066907
           9.12681970113738
           7.57495047878052
           8.63523335847877
           19.1937362970829
           6.07389903437912
           11.4898115541445
            5.3121344221563
           20.3746629193693
           16.6949708480085
           24.1927866443465
           5.08110274742485
           31.0450646086885
           9.04983421160974
           6.67839482425574
           6.46396559192006
           6.38212439630411
           6.36940034980152
           8.65678871423386
          -0.99000130591828
           11.3859639708591
           4.70113513220574
           10.2788203636422
           6.14231304075649
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
         goto skip_6366_0;
   end;
   /*------------------------------------------*/

   do _i_=1 to 42; _xrow_6366_0_{_i_} = 0; end;

   _xrow_6366_0_[1] = 1;

   _temp_ = 1;
   select (_tipe_);
      when ('1') _xrow_6366_0_[2] = _temp_;
      when ('2') _xrow_6366_0_[3] = _temp_;
      when ('3') _xrow_6366_0_[4] = _temp_;
      otherwise do; _badval_ = 1; goto skip_6366_0; end;
   end;

   _temp_ = 1;
   select (_Country_);
      when ('Australia') _xrow_6366_0_[5] = _temp_;
      when ('Austria') _xrow_6366_0_[6] = _temp_;
      when ('Bahrain') _xrow_6366_0_[7] = _temp_;
      when ('Belgium') _xrow_6366_0_[8] = _temp_;
      when ('Brazil') _xrow_6366_0_[9] = _temp_;
      when ('Canada') _xrow_6366_0_[10] = _temp_;
      when ('Channel Island') _xrow_6366_0_[11] = _temp_;
      when ('Cyprus') _xrow_6366_0_[12] = _temp_;
      when ('Czech Republic') _xrow_6366_0_[13] = _temp_;
      when ('Denmark') _xrow_6366_0_[14] = _temp_;
      when ('EIRE') _xrow_6366_0_[15] = _temp_;
      when ('European Commu') _xrow_6366_0_[16] = _temp_;
      when ('Finland') _xrow_6366_0_[17] = _temp_;
      when ('France') _xrow_6366_0_[18] = _temp_;
      when ('Germany') _xrow_6366_0_[19] = _temp_;
      when ('Greece') _xrow_6366_0_[20] = _temp_;
      when ('Iceland') _xrow_6366_0_[21] = _temp_;
      when ('Israel') _xrow_6366_0_[22] = _temp_;
      when ('Italy') _xrow_6366_0_[23] = _temp_;
      when ('Japan') _xrow_6366_0_[24] = _temp_;
      when ('Lebanon') _xrow_6366_0_[25] = _temp_;
      when ('Lithuania') _xrow_6366_0_[26] = _temp_;
      when ('Malta') _xrow_6366_0_[27] = _temp_;
      when ('Netherlands') _xrow_6366_0_[28] = _temp_;
      when ('Norway') _xrow_6366_0_[29] = _temp_;
      when ('Poland') _xrow_6366_0_[30] = _temp_;
      when ('Portugal') _xrow_6366_0_[31] = _temp_;
      when ('Saudi Arabia') _xrow_6366_0_[32] = _temp_;
      when ('Singapore') _xrow_6366_0_[33] = _temp_;
      when ('Spain') _xrow_6366_0_[34] = _temp_;
      when ('Sweden') _xrow_6366_0_[35] = _temp_;
      when ('Switzerland') _xrow_6366_0_[36] = _temp_;
      when ('USA') _xrow_6366_0_[37] = _temp_;
      when ('United Arab Em') _xrow_6366_0_[38] = _temp_;
      when ('United Kingdom') _xrow_6366_0_[39] = _temp_;
      when ('Unspecified') _xrow_6366_0_[40] = _temp_;
      otherwise do; _badval_ = 1; goto skip_6366_0; end;
   end;

   _xrow_6366_0_[41] = Quantity;

   _xrow_6366_0_[42] = UnitPrice;

   do _i_=1 to 42;
      _linp_ + _xrow_6366_0_{_i_} * _beta_6366_0_{_i_};
   end;

   skip_6366_0:
   label P_sales = 'Predicted: sales';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      P_sales = _linp_;
   end; else do;
      _linp_ = .;
      P_sales = .;
   end;
   /*------------------------------------------*/
   /*_VA_DROP*/ drop 'P_sales'n;
      'P_sales_6366'n='P_sales'n;
   /*------------------------------------------*/