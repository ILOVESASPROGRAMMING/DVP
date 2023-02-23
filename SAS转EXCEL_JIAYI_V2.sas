%macro Export;

	ods listing close;

	*���߼���DATA�е�SAS���ݼ�������ȡ�������ں����TEST��;
	proc sql noprint;
		select memname into:test separated by ' '
		from dictionary.tables
		where libname='DATA';
	quit;

	*��ods excel���proc print��佫���SAS���ݼ�ת����һ���������sheet��xlxs�ļ�;
	%let name1=%scan(&test,1);
	ods excel file="&source" options(sheet_name="&NAME1.");
	proc print data=data.&name1. noobs label;
	quit;

	%let n=&sqlobs;
	%do i=2 %to &n;
		%let name=%scan(&test,&i);	
		ods excel options(sheet_name="&name.");
		proc print data=data.&name.  noobs  label;
		quit;
	%end;

	ods excel close;
	%mend;

LIBNAME DATA "E:\SAS_DATA\DZSM_20230217"; *���޸ģ��洢SAS���ݼ����߼���;
OPTIONS FMTSEARCH=(DATA); *�洢format���߼���;
%let source=C:\Users\Administrator\Desktop\COMBINED.xlsx; *���޸ģ������EXCEL��ŵ�λ��;
proc format library=work cntlin=data.format;
quit;
%Export;

*ODS tagsets.excelxp file="test.xml" options(doc="help"); *�鿴suboptions;
