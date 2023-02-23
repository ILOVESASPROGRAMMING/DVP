LIBNAME RAWDATA "E:\SAS_DATA\DZSM_20230217";
OPTIONS FMTSEARCH=(RAWDATA);


**************************************************生成纵向数据集**************************************************;

%MACRO lb(N=,LBTEST=,NAM=,LBCAT=,DM=); *抽取横向结构数据集中的其中一个检测项目并转换成纵向结构数据集;
	DATA LB&N.;
		RETAIN siteid subjectid Studyevent VISIT ItemGroupRepeatKey LBCAT LBTEST LBORRESU LBORRES LBNRIND LBCLSIG; *RETAIN语句有两个作用：1. 声明变量顺序 2. 声明这些变量进入下次迭代时保留上一次迭代的值;
		LENGTH LBCAT LBTEST LBORRES $30. LBORRESU $10. ;
		SET RAWDATA.&DM.;

		*给新变量赋值;
		LBCAT="&LBCAT"; *检测项目的类别;
		LBTEST="&LBTEST"; *检测项目;
		LBORRESU=VVALUE(&NAM.ORRESU); *项目检测值的单位;
		LBORRES=&NAM.ORRES; *检测项目的检测值;
		LBNRIND=&NAM.NRIND; *检测项目的检测值是否异常;
		LBCLSIG=&NAM.CLSIG; *检测项目的检测值是否具有临床意义;

		LABEL
		siteid="中心编号"
		LBCAT="检测类型"
		LBTEST lbtest="检测项目"
		LBORRESU="单位"
		LBORRES="检测结果"
		LBNRIND="是否异常"
		LBCLSIG="临床意义";

		FORMAT
		LBNRIND NRIND.
		LBCLSIG NYC.;
		KEEP siteid subjectid Studyevent VISIT ItemGroupRepeatKey LBCAT LBTEST LBORRESU LBORRES LBNRIND LBCLSIG;
	RUN;
%MEND;

%lb(n=1,lbtest=红细胞,nam=RBC,lbcat=血常规,dm=LB1);
%lb(n=2,lbtest=血红蛋白,nam=HGB,lbcat=血常规,dm=LB1);
%lb(n=3,lbtest=白细胞,nam=WBC,lbcat=血常规,dm=LB1);
%lb(n=4,lbtest=中性粒细胞比例,nam=NEU,lbcat=血常规,dm=LB1);
%lb(n=5,lbtest=血小板,nam=PLT,lbcat=血常规,dm=LB1);
%lb(n=6,lbtest=凝血酶原时间,nam=PT,lbcat=凝血功能,dm=LB1);
%lb(n=7,lbtest=活化部分凝血活酶时间,nam=APT,lbcat=凝血功能,dm=LB1);
%lb(n=8,lbtest=凝血酶时间,nam=TT,lbcat=凝血功能,dm=LB1);
%lb(n=9,lbtest=纤维蛋白原,nam=FIB,lbcat=凝血功能,dm=LB1);
%lb(n=10,lbtest=尿蛋白,nam=PRO,lbcat=尿常规,dm=LB1);
%lb(n=11,lbtest=尿潜血,nam=BLD,lbcat=尿常规,dm=LB1);
%lb(n=12,lbtest=尿糖,nam=GLU,lbcat=尿常规,dm=LB1);
%lb(n=13,lbtest=尿红细胞,nam=ERY,lbcat=尿常规,dm=LB1);
%lb(n=14,lbtest=尿白细胞,nam=LEU,lbcat=尿常规,dm=LB1);
%lb(n=15,lbtest=谷丙转氨酶,nam=ALT,lbcat=肝功能,dm=LB1);
%lb(n=16,lbtest=谷草转氨酶,nam=AST,lbcat=肝功能,dm=LB1);
%lb(n=17,lbtest=总胆红素,nam=TBL,lbcat=肝功能,dm=LB1);
%lb(n=18,lbtest=碱性磷酸酶,nam=ALP,lbcat=肝功能,dm=LB1);
%lb(n=19,lbtest=γ-谷氨酰转肽酶,nam=GGT,lbcat=肝功能,dm=LB1);
%lb(n=20,lbtest=尿酸,nam=UA,lbcat=肾功能,dm=LB1);
%lb(n=21,lbtest=尿素,nam=UR,lbcat=肾功能,dm=LB1);
%lb(n=22,lbtest=血肌酐,nam=CR,lbcat=肾功能,dm=LB1);
%lb(n=23,lbtest=总胆固醇,nam=TC,lbcat=血脂,dm=LB1);
%lb(n=24,lbtest=高密度脂蛋白胆固醇,nam=HDL,lbcat=血脂,dm=LB1);
%lb(n=25,lbtest=非高密度脂蛋白胆固醇,nam=NHDL,lbcat=血脂,dm=LB1);
%lb(n=26,lbtest=低密度脂蛋白胆固醇,nam=LDL,lbcat=血脂,dm=LB1);
%lb(n=27,lbtest=甘油三酯,nam=TG,lbcat=血脂,dm=LB1);
%lb(n=28,lbtest=载脂蛋白A1,nam=APA,lbcat=血脂,dm=LB1);
%lb(n=29,lbtest=载脂蛋白B,nam=APB,lbcat=血脂,dm=LB1);
%lb(n=30,lbtest=同型半胱氨酸,nam=HCY,lbcat=同型半胱氨酸,dm=LB1);
%lb(n=31,lbtest=糖化血红蛋白,nam=HBA,lbcat=糖化血红蛋白,dm=LB1);

%lb(n=32,lbtest=红细胞,nam=RBC,lbcat=血常规,dm=LB3);
%lb(n=33,lbtest=血红蛋白,nam=HGB,lbcat=血常规,dm=LB3);
%lb(n=34,lbtest=白细胞,nam=WBC,lbcat=血常规,dm=LB3);
%lb(n=35,lbtest=中性粒细胞比例,nam=NEU,lbcat=血常规,dm=LB3);
%lb(n=36,lbtest=血小板,nam=PLT,lbcat=血常规,dm=LB3);
%lb(n=37,lbtest=凝血酶原时间,nam=PT,lbcat=凝血功能,dm=LB3);
%lb(n=38,lbtest=活化部分凝血活酶时间,nam=APT,lbcat=凝血功能,dm=LB3);
%lb(n=39,lbtest=凝血酶时间,nam=TT,lbcat=凝血功能,dm=LB3);
%lb(n=40,lbtest=纤维蛋白原,nam=FIB,lbcat=凝血功能,dm=LB3);
%lb(n=41,lbtest=尿蛋白,nam=PRO,lbcat=尿常规,dm=LB3);
%lb(n=42,lbtest=尿潜血,nam=BLD,lbcat=尿常规,dm=LB3);
%lb(n=43,lbtest=尿糖,nam=GLU,lbcat=尿常规,dm=LB3);
%lb(n=44,lbtest=尿红细胞,nam=ERY,lbcat=尿常规,dm=LB3);
%lb(n=45,lbtest=尿白细胞,nam=LEU,lbcat=尿常规,dm=LB3);
%lb(n=46,lbtest=谷丙转氨酶,nam=ALT,lbcat=肝功能,dm=LB3);
%lb(n=47,lbtest=谷草转氨酶,nam=AST,lbcat=肝功能,dm=LB3);
%lb(n=48,lbtest=总胆红素,nam=TBL,lbcat=肝功能,dm=LB3);
%lb(n=49,lbtest=碱性磷酸酶,nam=ALP,lbcat=肝功能,dm=LB3);
%lb(n=50,lbtest=γ-谷氨酰转肽酶,nam=GGT,lbcat=肝功能,dm=LB3);
%lb(n=51,lbtest=尿酸,nam=UA,lbcat=肾功能,dm=LB3);
%lb(n=52,lbtest=尿素,nam=UR,lbcat=肾功能,dm=LB3);
%lb(n=53,lbtest=血肌酐,nam=CR,lbcat=肾功能,dm=LB3);


%lb(n=54,lbtest=红细胞,nam=RBC,lbcat=血常规,dm=LB6);
%lb(n=55,lbtest=血红蛋白,nam=HGB,lbcat=血常规,dm=LB6);
%lb(n=56,lbtest=白细胞,nam=WBC,lbcat=血常规,dm=LB6);
%lb(n=57,lbtest=中性粒细胞比例,nam=NEU,lbcat=血常规,dm=LB6);
%lb(n=58,lbtest=血小板,nam=PLT,lbcat=血常规,dm=LB6);
%lb(n=59,lbtest=凝血酶原时间,nam=PT,lbcat=凝血功能,dm=LB6);
%lb(n=60,lbtest=活化部分凝血活酶时间,nam=APT,lbcat=凝血功能,dm=LB6);
%lb(n=61,lbtest=凝血酶时间,nam=TT,lbcat=凝血功能,dm=LB6);
%lb(n=62,lbtest=纤维蛋白原,nam=FIB,lbcat=凝血功能,dm=LB6);
%lb(n=63,lbtest=尿蛋白,nam=PRO,lbcat=尿常规,dm=LB6);
%lb(n=64,lbtest=尿潜血,nam=BLD,lbcat=尿常规,dm=LB6);
%lb(n=65,lbtest=尿糖,nam=GLU,lbcat=尿常规,dm=LB6);
%lb(n=66,lbtest=尿红细胞,nam=ERY,lbcat=尿常规,dm=LB6);
%lb(n=67,lbtest=尿白细胞,nam=LEU,lbcat=尿常规,dm=LB6);
%lb(n=68,lbtest=谷丙转氨酶,nam=ALT,lbcat=肝功能,dm=LB6);
%lb(n=69,lbtest=谷草转氨酶,nam=AST,lbcat=肝功能,dm=LB6);
%lb(n=70,lbtest=总胆红素,nam=TBL,lbcat=肝功能,dm=LB6);
%lb(n=71,lbtest=碱性磷酸酶,nam=ALP,lbcat=肝功能,dm=LB6);
%lb(n=72,lbtest=γ-谷氨酰转肽酶,nam=GGT,lbcat=肝功能,dm=LB6);
%lb(n=73,lbtest=尿酸,nam=UA,lbcat=肾功能,dm=LB6);
%lb(n=74,lbtest=尿素,nam=UR,lbcat=肾功能,dm=LB6);
%lb(n=75,lbtest=血肌酐,nam=CR,lbcat=肾功能,dm=LB6);


DATA LB; *合并所有检测项目数据集成LB;
SET LB1-LB75;
RUN;

PROC DATASETS NOLIST; *删除单个数据集;
DELETE LB1-LB75;
QUIT;

**************************************************生成纵向数据集**************************************************;

**************************************************合并纵向数据集和正常值范围**************************************************;

PROC SORT DATA=LB; 
BY subjectid StudyEvent LBCAT LBTEST;
RUN;

*运行下列两个PROCSTEP前请先确认观测值的唯一性，例如一个subjectid在数据集IE和DM中只能有一条观测值;

PROC SORT DATA=RAWDATA.IE; 
BY subjectid;
RUN;

PROC SORT DATA=RAWDATA.DM; *SAS数据集为非全集，所以需要一个全集数据集作为参照物;
BY subjectid;
RUN;

DATA LB_COMBINED; *生成可以与《正常值范围模板》拼接的数据集;
	MERGE RAWDATA.DM(KEEP=SUBJECTID BRTHDAT SEX) RAWDATA.IE(KEEP=SUBJECTID RFICDAT) LB; 
	BY SUBJECTID;

	*如果日期变量是数值型请根据实际情况删除下列两行代码：;
	DATE1=INPUT(SUBSTR(KCOMPRESS(RFICDAT),1,10),YYMMDD10.);
	DATE2=INPUT(SUBSTR(KCOMPRESS(BRTHDAT),1,10),YYMMDD10.);

	AGE=INT((DATE1-DATE2)/365.25);
	FORMAT DATE1 DATE2 YYMMDD10.;

	*根据《实验室检测正常值范围》进行分组;
	IF 
		(siteid=1 AND LBCAT="肝功能" AND LBTEST="碱性磷酸酶" AND SEX=0 AND AGE>=50) 
		OR (siteid=1 AND LBCAT="肾功能" AND LBTEST="尿素"  AND  SEX=1 AND AGE>=60) 
		OR (siteid=1 AND LBCAT="肾功能" AND LBTEST="尿素"  AND  SEX=0 AND AGE>=60) 
		OR (siteid=1 AND LBCAT="肾功能" AND LBTEST="血肌酐"  AND SEX=1 AND AGE>=60)   
		OR (siteid=1 AND LBCAT="肾功能" AND LBTEST="血肌酐"  AND SEX=0 AND AGE>=60)   
		OR (siteid=2 AND LBCAT="肝功能" AND LBTEST="碱性磷酸酶" AND SEX=0 AND AGE>=50) 
		OR (siteid=2 AND lbcat="肾功能" AND LBTEST="尿素"  AND SEX=1 AND AGE>60) 
		OR (siteid=2 AND lbcat="肾功能" AND LBTEST="尿素"  AND SEX=0 AND AGE>60) 
		OR (siteid=2 AND LBCAT="肾功能" AND LBTEST="血肌酐"  AND SEX=1 AND AGE>=60)
		OR (siteid=2 AND LBCAT="肾功能" AND LBTEST="血肌酐"  AND SEX=0 AND AGE>=60)
	THEN AGELV=2;
	ELSE AGELV=1;

	LBORRES=compress(LBORRES,"/ul");
	LBORRES=tranwrd(LBORRES,"＜","0");
	LBORRES=tranwrd(LBORRES,"。",".");
	LBORRES=tranwrd(LBORRES,",",".");

	DROP BRTHDAT RFICDAT AGE;
RUN;

PROC IMPORT DATAFILE="E:\SAS_DATA\DZSM_20230217\正常值范围模板.xlsx" OUT=WORK.LBNR REPLACE  DBMS=xlsx; *导入《正常值范围模板》生成SAS数据集;
RUN;

DATA LBNR; *清理数据集《正常值范围模板》;
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

DATA LB_WITH_LIMITS; *合并纵向数据集和正常值范围;
MERGE LB_COMBINED LBNR;
BY siteid LBCAT LBTEST SEX AGELV;
IF SUBJECTID^="";
RUN;

PROC SORT DATA=LB_WITH_LIMITS; *排序数据集LB_WITH_LIMITS;
BY siteid SUBJECTID StudyEvent LBCAT LBTEST;
RUN;

data LB_CLEAN; *该数据集配合LAG函数使用;
RETAIN  siteid subjectid AGE SEX StudyEvent VISIT LBCAT LBTEST LBORRES LBNRIND LBCLSIG LBORNRLO LBORNRHI;
LABEL LBORNRLO="下限" LBORNRHI="上限";
SET LB_WITH_LIMITS;
KEEP siteid subjectid AGE SEX StudyEvent VISIT LBCAT LBTEST LBORRES LBNRIND LBCLSIG LBORNRLO LBORNRHI;
run;

PROC SORT DATA=LB_CLEAN; *排序为后续LAG函数的使用做准备;
BY siteid subjectid LBTEST LBCAT VISIT;
RUN;

PROC DATASETS LIB=WORK; *删除多余数据集，保留LB_CLEAN;
DELETE LB LB_COMBINED LB_WITH_LIMITS LBNR;
QUIT;

**************************************************合并纵向数据集和正常值范围**************************************************;

**************************************************出质疑**************************************************;

*****质疑1*****;

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
	THEN QUERY=COMPRESS(LBTEST||"检测值（"||LBORRES||"）不在正常值范围（"||LBORNRLO||"-"||LBORNRHI||"）内，但“是否异常”为“正常”，请核实。");
	IF(LBORRES-LBORNRLO GE 0 AND  LBORRES-LBORNRHI LE 0) AND LBNRIND=1
	THEN QUERY=COMPRESS(LBTEST||"检测值（"||LBORRES||"）在正常值范围（"||LBORNRLO||"-"||LBORNRHI||"）内，但“是否异常”为“异常”，请核实。");

	CRFNAME=LBCAT;
	IF QUERY^="";
	LABEL=COMPRESS(LBTEST||"-临床意义");
	LABEL LBCAT="eCRF名称" LABEL="变量标签";
	KEEP siteid subjectid StudyEvent VISIT CRFNAME LABEL QUERY;
run;

data QUERY.QUERY1;
RETAIN siteid subjectid StudyEvent VISIT CRFNAME LBCAT LBTEST LBORRES LBNRIND LBORNRLO LBORNRHI QUERY;
SET QUERY1;
RUN;

PROC DATASETS LIB=WORK;
DELETE LB1 QUERY1;
QUIT;

*****质疑1*****;

*****质疑2*****;

DATA QUERY2; 
	SET LB_CLEAN;
	LAGORRES=LAG(LBORRES);
	LAGNRIND=LAG(LBNRIND);
	LAGCLSIG=LAG(LBCLSIG);
	LENGTH QUERY $100.;

	IF LAGORRES-0^=. AND LBORRES-0^=. AND LBORNRLO-0^=. THEN DO;

		IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="访视6" AND LAG(STUDYEVENT)="访视1" AND LBTEST=LAG(LBTEST) AND
		((((LAGORRES-LBORNRLO<0) AND (LAGORRES-LBORRES>0)) OR ((LAGORRES-LBORNRHI>0) AND (LAGORRES-LBORRES<0))) AND LAGCLSIG=1 AND LBCLSIG=0) 
		THEN QUERY=COMPRESS(LBTEST||"访视1检测值（"||lagORRES||"）“临床意义”为“是”，但访视6结果（"||LBORRES||"）异常加重，“临床意义”为“否”");


		IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="访视6" AND LAG(STUDYEVENT)="访视1" AND LBTEST=LAG(LBTEST) AND
		((((LAGORRES-LBORNRLO<0) AND (LAGORRES-LBORRES<0)) OR ((LAGORRES-LBORNRHI>0) AND (LAGORRES-LBORRES>0))) AND LAGCLSIG=0 AND LBCLSIG=1) 
		THEN QUERY=COMPRESS(LBTEST||"访视1检测值（"||lagORRES||"）“临床意义”为“否”，但访视6结果（"||LBORRES||"）异常减轻，“临床意义”为“是”");



		IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="访视3" AND LAG(STUDYEVENT)="访视1" AND LBTEST=LAG(LBTEST) AND
		((((LAGORRES-LBORNRLO<0) AND (LAGORRES-LBORRES>0)) OR ((LAGORRES-LBORNRHI>0) AND (LAGORRES-LBORRES<0))) AND LAGCLSIG=1 AND LBCLSIG=0) 
		THEN QUERY=COMPRESS(LBTEST||"访视1检测值（"||lagORRES||"）“临床意义”为“是”，但访视3结果（"||LBORRES||"）异常加重，“临床意义”为“否”");
		IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="访视6" AND LAG(STUDYEVENT)="访视3" AND LBTEST=LAG(LBTEST) AND
		((((LAGORRES-LBORNRLO<0) AND (LAGORRES-LBORRES>0)) OR ((LAGORRES-LBORNRHI>0) AND (LAGORRES-LBORRES<0))) AND LAGCLSIG=1 AND LBCLSIG=0) 
		THEN QUERY=COMPRESS(LBTEST||"访视3检测值（"||lagORRES||"）“临床意义”为“是”，但访视6结果（"||LBORRES||"）异常加重，“临床意义”为“否”");
		IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="访视3" AND LAG(STUDYEVENT)="访视1" AND LBTEST=LAG(LBTEST) AND
		((((LAGORRES-LBORNRLO<0) AND (LAGORRES-LBORRES<0)) OR ((LAGORRES-LBORNRHI>0) AND (LAGORRES-LBORRES>0))) AND LAGCLSIG=0 AND LBCLSIG=1) 
		THEN QUERY=COMPRESS(LBTEST||"访视1检测值（"||lagORRES||"）“临床意义”为“否”，但访视3结果（"||LBORRES||"）异常减轻，“临床意义”为“是”");
		IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="访视6" AND LAG(STUDYEVENT)="访视3" AND LBTEST=LAG(LBTEST) AND
		((((LAGORRES-LBORNRLO<0) AND (LAGORRES-LBORRES<0)) OR ((LAGORRES-LBORNRHI>0) AND (LAGORRES-LBORRES>0))) AND LAGCLSIG=0 AND LBCLSIG=1) 
		THEN QUERY=COMPRESS(LBTEST||"访视3检测值（"||lagORRES||"）“临床意义”为“否”，但访视6结果（"||LBORRES||"）异常减轻，“临床意义”为“是”");
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

*****质疑2*****;

%output(data=query.query2,out=2);

*****质疑3*****;

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

	IF StudyEvent="访视2"   and ( ((LBTEST="血肌酐" OR LBTEST="尿素氮")  AND LBorres-LBornrhi>0) ) 
	THEN QUERY=COMPRESS("访视2"||LBTEST||"检测值（"||LBORRES||"）高于范围值上限（"||LBornrhi||"）。");
	IF StudyEvent="访视2"   and (((LBTEST="谷草转氨酶" OR LBTEST="谷丙转氨酶")  AND LBorres-1.5*LBornrhi>0)  ) 
	THEN QUERY=COMPRESS("访视2"||LBTEST||"检测值（"||LBORRES||"）高于范围值上限（"||LBornrhi||"）1.5倍。");

	IF QUERY^="";
	LBLABEL=VLABEL(EORRES1);
	CRFNAME="纳入排除标准";
	LABEL crfNAME="eCRF名称" LBLABEL="变量标签";
	KEEP siteid SUBJECTID  StudyEvent crfNAME ItemGroupRepeatKey   sex age  LBLABEL   QUERY ;
RUN;

data QUERY.QUERY3;
RETAIN siteid subjectid StudyEvent VISIT CRFNAME LBCAT LBTEST label LBORRES LBNRIND LBORNRLO LBORNRHI QUERY;
SET QUERY3;
RUN;

PROC DATASETS LIB=WORK;
DELETE QUERY3;
QUIT;

*****质疑3*****;

*****质疑4*****;

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

	IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="访视6" AND LAG(STUDYEVENT)="访视1" AND LBTEST=LAG(LBTEST) AND (LAGNRIND=0 OR (LAGCLSIG=0 AND LAGNRIND=1)) AND LBNRIND=1 AND LBCLSIG=1
	THEN QUERY=COMPRESS(LBTEST||"访视1检测值正常或异常无临床意义，但访视6异常有临床意义，请核实是否需要报AE。");


	IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="访视3" AND LAG(STUDYEVENT)="访视1" AND LBTEST=LAG(LBTEST) AND (LAGNRIND=0 OR (LAGCLSIG=0 AND LAGNRIND=1)) AND LBNRIND=1 AND LBCLSIG=1
	THEN QUERY=COMPRESS(LBTEST||"访视1检测值正常或异常无临床意义，但访视3异常有临床意义，请核实是否需要报AE。");
	IF SUBJECTID=LAG(SUBJECTID) AND STUDYEVENT="访视6" AND LAG(STUDYEVENT)="访视3" AND LBTEST=LAG(LBTEST) AND (LAGNRIND=0 OR (LAGCLSIG=0 AND LAGNRIND=1)) AND LBNRIND=1 AND LBCLSIG=1
	THEN QUERY=COMPRESS(LBTEST||"访视3检测值正常或异常无临床意义，但访视6异常有临床意义，请核实是否需要报AE。");

	IF QUERY^="";
	LBLABEL=compress(LBTEST||"-异常标记");
	LABEL LBCAT="eCRF名称" LBLABEL="变量标签";
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

*****质疑4*****;

