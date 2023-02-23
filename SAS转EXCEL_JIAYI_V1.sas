%macro Export;

	ods listing close;

	*将逻辑库DATA中的SAS数据集名称提取出来放在宏变量TEST中;
	proc sql noprint;
		select memname into:test separated by ' '
		from dictionary.tables
		where libname='DATA';
	quit;

	*用ods tagsets.excelxp语句和proc print语句将多个SAS数据集转换成一个包含多个sheet的xlxs文件;
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

LIBNAME DATA "E:\SAS_DATA\DZSM_20230217"; *请修改：存储SAS数据集的逻辑库;
OPTIONS FMTSEARCH=(DATA); *存储format的逻辑库;
%let source=C:\Users\Administrator\Desktop\COMBINED.xlsx; *请修改：输出的EXCEL存放的位置;
proc format library=work cntlin=data.format;
quit;
%Export;

ODS tagsets.excelxp file="test.xml" options(doc="help");
