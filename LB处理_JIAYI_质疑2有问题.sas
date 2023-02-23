LIBNAME RAWDATA "E:\SAS_DATA\DZSM_20230217";
OPTIONS FMTSEARCH=(RAWDATA);


**************************************************�����������ݼ�**************************************************;

%MACRO lb(N=,LBTEST=,NAM=,LBCAT=,DM=); *��ȡ����ṹ���ݼ��е�����һ�������Ŀ��ת��������ṹ���ݼ�;
	DATA LB&N.;
		RETAIN siteid subjectid Studyevent VISIT ItemGroupRepeatKey LBCAT LBTEST LBORRESU LBORRES LBNRIND LBCLSIG; *RETAIN������������ã�1. ��������˳�� 2. ������Щ���������´ε���ʱ������һ�ε�����ֵ;
		LENGTH LBCAT LBTEST LBORRES $30. LBORRESU $10. ;
		SET RAWDATA.&DM.;

		*���±�����ֵ;
		LBCAT="&LBCAT"; *�����Ŀ�����;
		LBTEST="&LBTEST"; *�����Ŀ;
		LBORRESU=VVALUE(&NAM.ORRESU); *��Ŀ���ֵ�ĵ�λ;
		LBORRES=&NAM.ORRES; *�����Ŀ�ļ��ֵ;
		LBNRIND=&NAM.NRIND; *�����Ŀ�ļ��ֵ�Ƿ��쳣;
		LBCLSIG=&NAM.CLSIG; *�����Ŀ�ļ��ֵ�Ƿ�����ٴ�����;

		LABEL
		siteid="���ı��"
		LBCAT="�������"
		LBTEST lbtest="�����Ŀ"
		LBORRESU="��λ"
		LBORRES="�����"
		LBNRIND="�Ƿ��쳣"
		LBCLSIG="�ٴ�����";

		FORMAT
		LBNRIND NRIND.
		LBCLSIG NYC.;
		KEEP siteid subjectid Studyevent VISIT ItemGroupRepeatKey LBCAT LBTEST LBORRESU LBORRES LBNRIND LBCLSIG;
	RUN;
%MEND;

%lb(n=1,lbtest=��ϸ��,nam=RBC,lbcat=Ѫ����,dm=LB1);
%lb(n=2,lbtest=Ѫ�쵰��,nam=HGB,lbcat=Ѫ����,dm=LB1);
%lb(n=3,lbtest=��ϸ��,nam=WBC,lbcat=Ѫ����,dm=LB1);
%lb(n=4,lbtest=������ϸ������,nam=NEU,lbcat=Ѫ����,dm=LB1);
%lb(n=5,lbtest=ѪС��,nam=PLT,lbcat=Ѫ����,dm=LB1);
%lb(n=6,lbtest=��Ѫøԭʱ��,nam=PT,lbcat=��Ѫ����,dm=LB1);
%lb(n=7,lbtest=�������Ѫ��øʱ��,nam=APT,lbcat=��Ѫ����,dm=LB1);
%lb(n=8,lbtest=��Ѫøʱ��,nam=TT,lbcat=��Ѫ����,dm=LB1);
%lb(n=9,lbtest=��ά����ԭ,nam=FIB,lbcat=��Ѫ����,dm=LB1);
%lb(n=10,lbtest=�򵰰�,nam=PRO,lbcat=�򳣹�,dm=LB1);
%lb(n=11,lbtest=��ǱѪ,nam=BLD,lbcat=�򳣹�,dm=LB1);
%lb(n=12,lbtest=����,nam=GLU,lbcat=�򳣹�,dm=LB1);
%lb(n=13,lbtest=���ϸ��,nam=ERY,lbcat=�򳣹�,dm=LB1);
%lb(n=14,lbtest=���ϸ��,nam=LEU,lbcat=�򳣹�,dm=LB1);
%lb(n=15,lbtest=�ȱ�ת��ø,nam=ALT,lbcat=�ι���,dm=LB1);
%lb(n=16,lbtest=�Ȳ�ת��ø,nam=AST,lbcat=�ι���,dm=LB1);
%lb(n=17,lbtest=�ܵ�����,nam=TBL,lbcat=�ι���,dm=LB1);
%lb(n=18,lbtest=��������ø,nam=ALP,lbcat=�ι���,dm=LB1);
%lb(n=19,lbtest=��-�Ȱ���ת��ø,nam=GGT,lbcat=�ι���,dm=LB1);
%lb(n=20,lbtest=����,nam=UA,lbcat=������,dm=LB1);
%lb(n=21,lbtest=����,nam=UR,lbcat=������,dm=LB1);
%lb(n=22,lbtest=Ѫ����,nam=CR,lbcat=������,dm=LB1);
%lb(n=23,lbtest=�ܵ��̴�,nam=TC,lbcat=Ѫ֬,dm=LB1);
%lb(n=24,lbtest=���ܶ�֬���׵��̴�,nam=HDL,lbcat=Ѫ֬,dm=LB1);
%lb(n=25,lbtest=�Ǹ��ܶ�֬���׵��̴�,nam=NHDL,lbcat=Ѫ֬,dm=LB1);
%lb(n=26,lbtest=���ܶ�֬���׵��̴�,nam=LDL,lbcat=Ѫ֬,dm=LB1);
%lb(n=27,lbtest=��������,nam=TG,lbcat=Ѫ֬,dm=LB1);
%lb(n=28,lbtest=��֬����A1,nam=APA,lbcat=Ѫ֬,dm=LB1);
%lb(n=29,lbtest=��֬����B,nam=APB,lbcat=Ѫ֬,dm=LB1);
%lb(n=30,lbtest=ͬ�Ͱ��װ���,nam=HCY,lbcat=ͬ�Ͱ��װ���,dm=LB1);
%lb(n=31,lbtest=�ǻ�Ѫ�쵰��,nam=HBA,lbcat=�ǻ�Ѫ�쵰��,dm=LB1);

%lb(n=32,lbtest=��ϸ��,nam=RBC,lbcat=Ѫ����,dm=LB3);
%lb(n=33,lbtest=Ѫ�쵰��,nam=HGB,lbcat=Ѫ����,dm=LB3);
%lb(n=34,lbtest=��ϸ��,nam=WBC,lbcat=Ѫ����,dm=LB3);
%lb(n=35,lbtest=������ϸ������,nam=NEU,lbcat=Ѫ����,dm=LB3);
%lb(n=36,lbtest=ѪС��,nam=PLT,lbcat=Ѫ����,dm=LB3);
%lb(n=37,lbtest=��Ѫøԭʱ��,nam=PT,lbcat=��Ѫ����,dm=LB3);
%lb(n=38,lbtest=�������Ѫ��øʱ��,nam=APT,lbcat=��Ѫ����,dm=LB3);
%lb(n=39,lbtest=��Ѫøʱ��,nam=TT,lbcat=��Ѫ����,dm=LB3);
%lb(n=40,lbtest=��ά����ԭ,nam=FIB,lbcat=��Ѫ����,dm=LB3);
%lb(n=41,lbtest=�򵰰�,nam=PRO,lbcat=�򳣹�,dm=LB3);
%lb(n=42,lbtest=��ǱѪ,nam=BLD,lbcat=�򳣹�,dm=LB3);
%lb(n=43,lbtest=����,nam=GLU,lbcat=�򳣹�,dm=LB3);
%lb(n=44,lbtest=���ϸ��,nam=ERY,lbcat=�򳣹�,dm=LB3);
%lb(n=45,lbtest=���ϸ��,nam=LEU,lbcat=�򳣹�,dm=LB3);
%lb(n=46,lbtest=�ȱ�ת��ø,nam=ALT,lbcat=�ι���,dm=LB3);
%lb(n=47,lbtest=�Ȳ�ת��ø,nam=AST,lbcat=�ι���,dm=LB3);
%lb(n=48,lbtest=�ܵ�����,nam=TBL,lbcat=�ι���,dm=LB3);
%lb(n=49,lbtest=��������ø,nam=ALP,lbcat=�ι���,dm=LB3);
%lb(n=50,lbtest=��-�Ȱ���ת��ø,nam=GGT,lbcat=�ι���,dm=LB3);
%lb(n=51,lbtest=����,nam=UA,lbcat=������,dm=LB3);
%lb(n=52,lbtest=����,nam=UR,lbcat=������,dm=LB3);
%lb(n=53,lbtest=Ѫ����,nam=CR,lbcat=������,dm=LB3);


%lb(n=54,lbtest=��ϸ��,nam=RBC,lbcat=Ѫ����,dm=LB6);
%lb(n=55,lbtest=Ѫ�쵰��,nam=HGB,lbcat=Ѫ����,dm=LB6);
%lb(n=56,lbtest=��ϸ��,nam=WBC,lbcat=Ѫ����,dm=LB6);
%lb(n=57,lbtest=������ϸ������,nam=NEU,lbcat=Ѫ����,dm=LB6);
%lb(n=58,lbtest=ѪС��,nam=PLT,lbcat=Ѫ����,dm=LB6);
%lb(n=59,lbtest=��Ѫøԭʱ��,nam=PT,lbcat=��Ѫ����,dm=LB6);
%lb(n=60,lbtest=�������Ѫ��øʱ��,nam=APT,lbcat=��Ѫ����,dm=LB6);
%lb(n=61,lbtest=��Ѫøʱ��,nam=TT,lbcat=��Ѫ����,dm=LB6);
%lb(n=62,lbtest=��ά����ԭ,nam=FIB,lbcat=��Ѫ����,dm=LB6);
%lb(n=63,lbtest=�򵰰�,nam=PRO,lbcat=�򳣹�,dm=LB6);
%lb(n=64,lbtest=��ǱѪ,nam=BLD,lbcat=�򳣹�,dm=LB6);
%lb(n=65,lbtest=����,nam=GLU,lbcat=�򳣹�,dm=LB6);
%lb(n=66,lbtest=���ϸ��,nam=ERY,lbcat=�򳣹�,dm=LB6);
%lb(n=67,lbtest=���ϸ��,nam=LEU,lbcat=�򳣹�,dm=LB6);
%lb(n=68,lbtest=�ȱ�ת��ø,nam=ALT,lbcat=�ι���,dm=LB6);
%lb(n=69,lbtest=�Ȳ�ת��ø,nam=AST,lbcat=�ι���,dm=LB6);
%lb(n=70,lbtest=�ܵ�����,nam=TBL,lbcat=�ι���,dm=LB6);
%lb(n=71,lbtest=��������ø,nam=ALP,lbcat=�ι���,dm=LB6);
%lb(n=72,lbtest=��-�Ȱ���ת��ø,nam=GGT,lbcat=�ι���,dm=LB6);
%lb(n=73,lbtest=����,nam=UA,lbcat=������,dm=LB6);
%lb(n=74,lbtest=����,nam=UR,lbcat=������,dm=LB6);
%lb(n=75,lbtest=Ѫ����,nam=CR,lbcat=������,dm=LB6);


DATA LB; *�ϲ����м����Ŀ���ݼ���LB;
SET LB1-LB75;
RUN;

PROC DATASETS NOLIST; *ɾ���������ݼ�;
DELETE LB1-LB75;
QUIT;

**************************************************�����������ݼ�**************************************************;

**************************************************�ϲ��������ݼ�������ֵ��Χ**************************************************;

PROC SORT DATA=LB; 
BY subjectid StudyEvent LBCAT LBTEST;
RUN;

*������������PROCSTEPǰ����ȷ�Ϲ۲�ֵ��Ψһ�ԣ�����һ��subjectid�����ݼ�IE��DM��ֻ����һ���۲�ֵ;

PROC SORT DATA=RAWDATA.IE; 
BY subjectid;
RUN;

PROC SORT DATA=RAWDATA.DM; *SAS���ݼ�Ϊ��ȫ����������Ҫһ��ȫ�����ݼ���Ϊ������;
BY subjectid;
RUN;

DATA LB_COMBINED; *���ɿ����롶����ֵ��Χģ�塷ƴ�ӵ����ݼ�;
	MERGE RAWDATA.DM(KEEP=SUBJECTID BRTHDAT SEX) RAWDATA.IE(KEEP=SUBJECTID RFICDAT) LB; 
	BY SUBJECTID;

	*������ڱ�������ֵ�������ʵ�����ɾ���������д��룺;
	DATE1=INPUT(SUBSTR(KCOMPRESS(RFICDAT),1,10),YYMMDD10.);
	DATE2=INPUT(SUBSTR(KCOMPRESS(BRTHDAT),1,10),YYMMDD10.);

	AGE=INT((DATE1-DATE2)/365.25);
	FORMAT DATE1 DATE2 YYMMDD10.;

	*���ݡ�ʵ���Ҽ������ֵ��Χ�����з���;
	IF 
		(siteid=1 AND LBCAT="�ι���" AND LBTEST="��������ø" AND SEX=0 AND AGE>=50) 
		OR (siteid=1 AND LBCAT="������" AND LBTEST="����"  AND  SEX=1 AND AGE>=60) 
		OR (siteid=1 AND LBCAT="������" AND LBTEST="����"  AND  SEX=0 AND AGE>=60) 
		OR (siteid=1 AND LBCAT="������" AND LBTEST="Ѫ����"  AND SEX=1 AND AGE>=60)   
		OR (siteid=1 AND LBCAT="������" AND LBTEST="Ѫ����"  AND SEX=0 AND AGE>=60)   
		OR (siteid=2 AND LBCAT="�ι���" AND LBTEST="��������ø" AND SEX=0 AND AGE>=50) 
		OR (siteid=2 AND lbcat="������" AND LBTEST="����"  AND SEX=1 AND AGE>60) 
		OR (siteid=2 AND lbcat="������" AND LBTEST="����"  AND SEX=0 AND AGE>60) 
		OR (siteid=2 AND LBCAT="������" AND LBTEST="Ѫ����"  AND SEX=1 AND AGE>=60)
		OR (siteid=2 AND LBCAT="������" AND LBTEST="Ѫ����"  AND SEX=0 AND AGE>=60)
	THEN AGELV=2;
	ELSE AGELV=1;

	LBORRES=compress(LBORRES,"/ul");
	LBORRES=tranwrd(LBORRES,"��","0");
	LBORRES=tranwrd(LBORRES,"��",".");
	LBORRES=tranwrd(LBORRES,",",".");

	DROP BRTHDAT RFICDAT AGE;
RUN;

PROC IMPORT DATAFILE="E:\SAS_DATA\DZSM_20230217\����ֵ��Χģ��.xlsx" OUT=WORK.LBNR REPLACE  DBMS=xlsx; *���롶����ֵ��Χģ�塷����SAS���ݼ�;
RUN;

DATA LBNR; *�������ݼ�������ֵ��Χģ�塷;
	SET LBNR;
	siteid=COMPRESS(siteid);
	SEX=COMPRESS(SEX);
	AGELV=COMPRESS(AGELV);
	LBCAT=COMPRESS(LBCAT);
	LBTEST=COMPRESS(LBTEST);
	LBORNRLO=COMPRESS(LBORNRLO);
	LBORNRHI=COMPRESS(LBORNRHI);
	LBORRESU1=COMPRESS(LBORRESU1);
RUN;

PROC SORT DATA=LB_COMBINED;
BY siteid LBCAT LBTEST SEX AGELV;
RUN;

PROC SORT DATA=LBNR;
BY siteid LBCAT LBTEST SEX AGELV;
RUN;

DATA LB_WITH_LIMITS; *�ϲ��������ݼ�������ֵ��Χ;
MERGE LB_COMBINED LBNR;
BY siteid LBCAT LBTEST SEX AGELV;
IF SUBJECTID^="";
RUN;

PROC SORT DATA=LB_WITH_LIMITS; *�������ݼ�LB_WITH_LIMITS;
BY siteid SUBJECTID StudyEvent LBCAT LBTEST;
RUN;

data LB_CLEAN; *�����ݼ����LAG����ʹ��;
RETAIN  siteid subjectid AGE SEX StudyEvent VISIT LBCAT LBTEST LBORRES LBNRIND LBCLSIG LBORNRLO LBORNRHI;
LABEL LBORNRLO="����" LBORNRHI="����";
SET LB_WITH_LIMITS;
KEEP siteid subjectid AGE SEX StudyEvent VISIT LBCAT LBTEST LBORRES LBNRIND LBCLSIG LBORNRLO LBORNRHI;
run;

PROC SORT DATA=LB_CLEAN; *����Ϊ����LAG������ʹ����׼��;
BY siteid subjectid LBTEST LBCAT VISIT;
RUN;

PROC DATASETS LIB=WORK; *ɾ���������ݼ�������LB_CLEAN;
DELETE LB LB_COMBINED LB_WITH_LIMITS LBNR;
QUIT;

**************************************************�ϲ��������ݼ�������ֵ��Χ**************************************************;

**************************************************������**************************************************;

*****����1*****;

DATA LB1;
RETAIN siteid subjectid StudyEvent VISIT LBCAT LBTEST LBORRES LBNRIND LBORNRLO LBORNRHI;
SET LB_CLEAN;
IF LBorres-0=. THEN DELETE;
IF LBornrlo-0=. THEN DELETE;
KEEP siteid subjectid StudyEvent VISIT LBCAT LBTEST LBORRES LBNRIND LBORNRLO LBORNRHI;
run;

DATA QUERY1; 
	LENGTH label QUERY $100.;
	SET LB1;

	IF(LBORRES-LBORNRLO<0 OR LBORRES-LBORNRHI>0) AND LBNRIND=0 
	THEN QUERY=COMPRESS(LBTEST||"���ֵ��"||LBORRES||"����������ֵ��Χ��"||LBORNRLO||"-"||LBORNRHI||"���ڣ������Ƿ��쳣��Ϊ�������������ʵ��");
	IF(LBORRES-LBORNRLO GE 0 AND  LBORRES-LBORNRHI LE 0) AND LBNRIND=1
	THEN QUERY=COMPRESS(LBTEST||"���ֵ��"||LBORRES||"��������ֵ��Χ��"||LBORNRLO||"-"||LBORNRHI||"���ڣ������Ƿ��쳣��Ϊ���쳣�������ʵ��");

	CRFNAME=LBCAT;
	IF QUERY^="";
	LABEL=COMPRESS(LBTEST||"-�ٴ�����");
	LABEL LBCAT="eCRF����" LABEL="������ǩ";
	KEEP siteid subjectid StudyEvent VISIT CRFNAME LABEL QUERY;
run;

data QUERY.QUERY1;
RETAIN siteid subjectid StudyEvent VISIT CRFNAME LBCAT LBTEST LBORRES LBNRIND LBORNRLO LBORNRHI QUERY;
SET QUERY1;
RUN;

PROC DATASETS LIB=WORK;
DELETE LB1 QUERY1;
QUIT;

*****����1*****;

*****����2*****;

DATA QUERY2; 
	SET LB_CLEAN;
	LAGORRES=LAG(LBORRES);
	LAGNRIND=LAG(LBNRIND);
	LAGCLSIG=LAG(LBCLSIG);
	LENGTH QUERY $100.;

	IF LAGORRES-0^=. AND LBORRES-0^=. AND LBORNRLO-0^=. THEN DO;

		IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="����6" AND LAG(STUDYEVENT)="����1" AND LBTEST=LAG(LBTEST) AND
		((((LAGORRES-LBORNRLO<0) AND (LAGORRES-LBORRES>0)) OR ((LAGORRES-LBORNRHI>0) AND (LAGORRES-LBORRES<0))) AND LAGCLSIG=1 AND LBCLSIG=0) 
		THEN QUERY=COMPRESS(LBTEST||"����1���ֵ��"||lagORRES||"�����ٴ����塱Ϊ���ǡ���������6�����"||LBORRES||"���쳣���أ����ٴ����塱Ϊ����");


		IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="����6" AND LAG(STUDYEVENT)="����1" AND LBTEST=LAG(LBTEST) AND
		((((LAGORRES-LBORNRLO<0) AND (LAGORRES-LBORRES<0)) OR ((LAGORRES-LBORNRHI>0) AND (LAGORRES-LBORRES>0))) AND LAGCLSIG=0 AND LBCLSIG=1) 
		THEN QUERY=COMPRESS(LBTEST||"����1���ֵ��"||lagORRES||"�����ٴ����塱Ϊ���񡱣�������6�����"||LBORRES||"���쳣���ᣬ���ٴ����塱Ϊ���ǡ�");



		IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="����3" AND LAG(STUDYEVENT)="����1" AND LBTEST=LAG(LBTEST) AND
		((((LAGORRES-LBORNRLO<0) AND (LAGORRES-LBORRES>0)) OR ((LAGORRES-LBORNRHI>0) AND (LAGORRES-LBORRES<0))) AND LAGCLSIG=1 AND LBCLSIG=0) 
		THEN QUERY=COMPRESS(LBTEST||"����1���ֵ��"||lagORRES||"�����ٴ����塱Ϊ���ǡ���������3�����"||LBORRES||"���쳣���أ����ٴ����塱Ϊ����");
		IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="����6" AND LAG(STUDYEVENT)="����3" AND LBTEST=LAG(LBTEST) AND
		((((LAGORRES-LBORNRLO<0) AND (LAGORRES-LBORRES>0)) OR ((LAGORRES-LBORNRHI>0) AND (LAGORRES-LBORRES<0))) AND LAGCLSIG=1 AND LBCLSIG=0) 
		THEN QUERY=COMPRESS(LBTEST||"����3���ֵ��"||lagORRES||"�����ٴ����塱Ϊ���ǡ���������6�����"||LBORRES||"���쳣���أ����ٴ����塱Ϊ����");
		IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="����3" AND LAG(STUDYEVENT)="����1" AND LBTEST=LAG(LBTEST) AND
		((((LAGORRES-LBORNRLO<0) AND (LAGORRES-LBORRES<0)) OR ((LAGORRES-LBORNRHI>0) AND (LAGORRES-LBORRES>0))) AND LAGCLSIG=0 AND LBCLSIG=1) 
		THEN QUERY=COMPRESS(LBTEST||"����1���ֵ��"||lagORRES||"�����ٴ����塱Ϊ���񡱣�������3�����"||LBORRES||"���쳣���ᣬ���ٴ����塱Ϊ���ǡ�");
		IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="����6" AND LAG(STUDYEVENT)="����3" AND LBTEST=LAG(LBTEST) AND
		((((LAGORRES-LBORNRLO<0) AND (LAGORRES-LBORRES<0)) OR ((LAGORRES-LBORNRHI>0) AND (LAGORRES-LBORRES>0))) AND LAGCLSIG=0 AND LBCLSIG=1) 
		THEN QUERY=COMPRESS(LBTEST||"����3���ֵ��"||lagORRES||"�����ٴ����塱Ϊ���񡱣�������6�����"||LBORRES||"���쳣���ᣬ���ٴ����塱Ϊ���ǡ�");
	END;

	IF QUERY^="";
RUN;

data QUERY.QUERY2;
RETAIN siteid subjectid StudyEvent CRFNAME LBCAT LBTEST LBORRES LBNRIND LBORNRLO LBORNRHI QUERY;
SET QUERY2;
CRFNAME=LBCAT;
KEEP siteid subjectid StudyEvent CRFNAME LBTEST label QUERY;
RUN;

PROC DATASETS LIB=WORK;
DELETE QUERY2;
QUIT;

*****����2*****;

%output(data=query.query2,out=2);

*****����3*****;

DATA LB1;
RETAIN siteid SUBJECTID StudyEvent ItemGroupRepeatKey LBCAT  LBTEST  LBorres LBNRIND LBCLSIG  LBornrlo LBornrhi QUERY EORRES1 sex age;
LENGTH QUERY $100.;
SET LB_CLEAN;
IF LBorres-0=. THEN DELETE;
IF LBornrlo-0=. THEN DELETE;
KEEP siteid SUBJECTID StudyEvent ItemGroupRepeatKey LBCAT  LBTEST  LBorres LBNRIND LBCLSIG  LBornrlo LBornrhi QUERY  EORRES1 sex age ;
RUN;

DATA QUERY3;
	RETAIN siteid  SUBJECTID StudyEvent crfNAME  ItemGroupRepeatKey  sex age LBTEST  LBLABEL  LBorres LBNRIND LBCLSIG  LBornrlo LBornrhi QUERY;
	LENGTH LBLABEL QUERY $100.;
	SET LB1;

	IF StudyEvent="����2"   and ( ((LBTEST="Ѫ����" OR LBTEST="���ص�")  AND LBorres-LBornrhi>0) ) 
	THEN QUERY=COMPRESS("����2"||LBTEST||"���ֵ��"||LBORRES||"�����ڷ�Χֵ���ޣ�"||LBornrhi||"����");
	IF StudyEvent="����2"   and (((LBTEST="�Ȳ�ת��ø" OR LBTEST="�ȱ�ת��ø")  AND LBorres-1.5*LBornrhi>0)  ) 
	THEN QUERY=COMPRESS("����2"||LBTEST||"���ֵ��"||LBORRES||"�����ڷ�Χֵ���ޣ�"||LBornrhi||"��1.5����");

	IF QUERY^="";
	LBLABEL=VLABEL(EORRES1);
	CRFNAME="�����ų���׼";
	LABEL crfNAME="eCRF����" LBLABEL="������ǩ";
	KEEP siteid SUBJECTID  StudyEvent crfNAME ItemGroupRepeatKey   sex age  LBLABEL   QUERY ;
RUN;

data QUERY.QUERY3;
RETAIN siteid subjectid StudyEvent VISIT CRFNAME LBCAT LBTEST label LBORRES LBNRIND LBORNRLO LBORNRHI QUERY;
SET QUERY3;
RUN;

PROC DATASETS LIB=WORK;
DELETE QUERY3;
QUIT;

*****����3*****;

*****����4*****;

DATA LB1;
RETAIN siteid SUBJECTID StudyEvent ItemGroupRepeatKey LBCAT  LBTEST  LBorres LBNRIND LBCLSIG  LBornrlo LBornrhi QUERY;
LENGTH QUERY $100.;
SET LB_CLEAN;
KEEP siteid SUBJECTID StudyEvent ItemGroupRepeatKey LBCAT  LBTEST  LBorres LBNRIND LBCLSIG  LBornrlo LBornrhi QUERY ;
RUN;

PROC SORT DATA=LB1;
BY siteid subjectid LBTEST LBCAT VISIT;
RUN;

DATA QUERY4(KEEP=siteid SUBJECTID StudyEvent LBCAT LBTEST ItemGroupRepeatKey LBLABEL QUERY);
	RETAIN siteid SUBJECTID StudyEvent LBCAT LBTEST ItemGroupRepeatKey LBLABEL QUERY;
	SET LB1;

	LAGORRES=LAG(LBORRES);
	LAGNRIND=LAG(LBNRIND);
	LAGCLSIG=LAG(LBCLSIG);

	LENGTH QUERY $100.;

	IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="����6" AND LAG(STUDYEVENT)="����1" AND LBTEST=LAG(LBTEST) AND (LAGNRIND=0 OR (LAGCLSIG=0 AND LAGNRIND=1)) AND LBNRIND=1 AND LBCLSIG=1
	THEN QUERY=COMPRESS(LBTEST||"����1���ֵ�������쳣���ٴ����壬������6�쳣���ٴ����壬���ʵ�Ƿ���Ҫ��AE��");


	IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="����3" AND LAG(STUDYEVENT)="����1" AND LBTEST=LAG(LBTEST) AND (LAGNRIND=0 OR (LAGCLSIG=0 AND LAGNRIND=1)) AND LBNRIND=1 AND LBCLSIG=1
	THEN QUERY=COMPRESS(LBTEST||"����1���ֵ�������쳣���ٴ����壬������3�쳣���ٴ����壬���ʵ�Ƿ���Ҫ��AE��");
	IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="����6" AND LAG(STUDYEVENT)="����3" AND LBTEST=LAG(LBTEST) AND (LAGNRIND=0 OR (LAGCLSIG=0 AND LAGNRIND=1)) AND LBNRIND=1 AND LBCLSIG=1
	THEN QUERY=COMPRESS(LBTEST||"����3���ֵ�������쳣���ٴ����壬������6�쳣���ٴ����壬���ʵ�Ƿ���Ҫ��AE��");

	IF QUERY^="";
	LBLABEL=compress(LBTEST||"-�쳣���");
	LABEL LBCAT="eCRF����" LBLABEL="������ǩ";
RUN;

data QUERY.QUERY4;
RETAIN siteid subjectid StudyEvent CRFNAME LBCAT LBTEST LBORRES LBNRIND LBORNRLO LBORNRHI QUERY;
SET QUERY4;
CRFNAME=LBCAT;
KEEP siteid subjectid StudyEvent CRFNAME LBTEST label QUERY;
RUN;

PROC DATASETS LIB=WORK;
DELETE QUERY4;
QUIT;

*****����4*****;

