/*Bank Rep */

/*
a. Open a checking and saving account for customer C031.
*/

INSERT INTO
CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_ADDRESS,CUSTOMER_COMPANY_NAME,CUSTOMER_DOB,
			CUSTOMER_GENDER,CUSTOMER_SSN,CUSTOMER_PHONE,DESIGNATED_REP_ID,CUSTOMER_EMAIL_ID,TIER_ID,BRANCH_ID)
VALUES( 'C031', 'renu sharma', '9406 Shady Promenade,Ah Fong Village,CA' ,'Santa Clara University', '1965-12-2', 'FEMALE',
		'677-26-7013', '539-611-5354', 'E001', 'insadton@gmail.com','T001', 'CA001' )

INSERT INTO ACCOUNT
(ACC_NO,ACC_TYPE_ID,CUSTOMER_ID,ACC_BALANCE,ACC_INTEREST,BRANCH_ID, ACC_OPEN_DATE)
VALUES('371366140170058','AT001','C031','500','0','CA001','2015-12-01')

INSERT INTO ACCOUNT
(ACC_NO,ACC_TYPE_ID,CUSTOMER_ID,ACC_BALANCE,ACC_INTEREST,BRANCH_ID,ACC_OPEN_DATE)
VALUES('371366140170059','AT002','C031','1000','0.03','CA001','2015-12-01')

SELECT *
FROM CUSTOMER C, ACCOUNT A
WHERE C.CUSTOMER_ID=A.CUSTOMER_ID AND C.CUSTOMER_ID='C031'

/*
b. Process customer loan request LQ001.
*/

INSERT INTO LOAN (LOAN_ID, CUSTOMER_ID, LOAN_TYPE_ID, PAYMENT_PLAN_ID, LOAN_AMT, LOAN_AMT_PAID, LOAN_AMT_PENDING, LOAN_STATUS,
					NEXT_DUE_DATE, COMPLETION_DATE, BRANCH_ID, PAYMENT_TIMESTAMP, STATUS_TIMESTAMP)
VALUES('L036', 'C011', 'LT002', 'PP005', 16232, 0, 16232,'APPLICATION COMPLETED', NULL, NULL, 'CA001', NULL, '2015-12-03 15:36:56')

SELECT *
FROM LOAN L
WHERE L.CUSTOMER_ID ='C011'
/*
c. Change customer C001’s L001 status to PEDING_DOCUMENT
*/

UPDATE L SET L.LOAN_STATUS='PEDING_DOCUMENT'
FROM LOAN L
WHERE L.LOAN_ID='L001'

SELECT *
FROM LOAN L
WHERE L.LOAN_ID='L001'

/*
d. Provide payment plan for client’s loan request ID LQ002 based on customer type.
*/

SELECT *
FROM PAYMENT_PLAN P
WHERE P.TIER_ID = 'T001' OR TIER_ID IN(
	SELECT C.TIER_ID
	FROM LOAN_REQ LQ, CUSTOMER C
	WHERE LQ.CUSTOMER_ID=C.CUSTOMER_ID AND LQ.LOAN_REQ_ID='LQ002')
