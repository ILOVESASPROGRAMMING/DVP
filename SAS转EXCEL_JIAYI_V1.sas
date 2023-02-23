%macro Export;

	ods listing close;

	*���߼���DATA�е�SAS���ݼ�������ȡ�������ں����TEST��;
	proc sql noprint;
		select memname into:test separated by ' '
		from dictionary.tables
		where libname='DATA';
	quit;

	*��ods tagsets.excelxp����proc print��佫���SAS���ݼ�ת����һ���������sheet��xlxs�ļ�;
	%let name1=%scan(&test,1);
	ods tagsets.excelxp	file="&source" style=Pearl options(sheet_name="&NAME1." autofit_height='YES' frozen_rowheaders='yes' sheet_interval='none'  autofilter='yes' autofilter_table='1' Embedded_Titles = 'no' absolute_column_width="COLS" Embedded_footnotes="no" Center_Horizontal = 'yes' fittopage="no"  Frozen_Headers="yes");
	proc print data=data.&name1. noobs label;
	quit;

	%let n=&sqlobs;
	%do i=2 %to &n;
		%let name=%scan(&test,&i);	
		ods tagsets.excelxp	style=Pearl options(sheet_name="&name." autofit_height='YES' frozen_rowheaders='yes' sheet_interval='none'  autofilter='yes' autofilter_table='1' Embedded_Titles = 'no' absolute_column_width="COLS" Embedded_footnotes="no" Center_Horizontal = 'yes' fittopage="no"  Frozen_Headers="yes");
		proc print data=data.&name.  noobs  label;
		quit;
	%end;

	ods tagsets.excelxp close;
	%mend;

LIBNAME DATA "E:\SAS_DATA\DZSM_20230217"; *���޸ģ��洢SAS���ݼ����߼���;
OPTIONS FMTSEARCH=(DATA); *�洢format���߼���;
%let source=C:\Users\Administrator\Desktop\COMBINED.xlsx; *���޸ģ������EXCEL��ŵ�λ��;
proc format library=work cntlin=data.format;
quit;
%Export;

ODS tagsets.excelxp file="test.xml" options(doc="help");
