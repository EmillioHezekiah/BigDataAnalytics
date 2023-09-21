data work.datastore;
   set work.datastore(obs=250000);
run;

proc means data=work.datastore nmiss;
run;


data work.datastore;
   set work.datastore;
   where not missing(InvoiceNo)
   and not missing(StockCode)
   and not missing(Description)
   and not missing(Quantity)
   and not missing(InvoiceDate)
   and not missing(UnitPrice)
   and not missing(CustomerID)
   and not missing(Country);
run;

data work.datastore;
  set work.datastore;
  sales = Quantity * UnitPrice;
  output;
run;


data _null_;
	file "/home/u63318254/sasuser.v94/UTS_BARU/rawfile.txt";
	set work.datastore;
	put _all_;
run;

data work.datastore;
	set work.datastore;
	row_num = _N_;
run;