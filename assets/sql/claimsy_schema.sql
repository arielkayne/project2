DROP DATABASE IF EXISTS claimsy_db;

CREATE DATABASE claimsy_db;

USE claimsy_db;

CREATE TABLE users(
user_id INT NOT NULL AUTO_INCREMENT,
-- date the user was added
user_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- automatically updates when user file is modifified
modified_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
modified_dt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
username VARCHAR(30) NOT NULL,
passwd VARCHAR(30) NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
email VARCHAR(30) NOT NULL,
-- have user input YYYY-MM-DD
birthday DATE,
-- US zip code
postal_code_us VARCHAR(5),
PRIMARY KEY (user_id)
);

CREATE TABLE health_claims(
healthclaim_id INT NOT NULL AUTO_INCREMENT,
-- date claim was added to d
healthclaim_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- updated every time a change is made to claim
ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
dt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
-- date that the service was provided, used to calculate how many days left to make a claim
service_date DATE,
provider_firstname VARCHAR(30) NOT NULL,
provider_lastname VARCHAR(30) NOT NULL,
-- can be different from the user (ex. children)
patient_firstname VARCHAR(30) NOT NULL,
patient_lastname VARCHAR(30) NOT NULL,
-- might be nice to have dropdown options like Doctor Visit, Specialist Visit, Mental Health, Surgical Procedure, Other
treatment_type VARCHAR(30),
treatment_outpatient BOOLEAN DEFAULT FALSE,
treatment_inpatient BOOLEAN DEFAULT FALSE,
-- a placeholder for a user to add notes about the visit
treatment_notes VARCHAR(511),
-- if payment was made at point of service...in $
payment_pos VARCHAR(11),
-- if payment was made after an invoice was received...in $
payment_invoiced VARCHAR(11),
insurance_primary VARCHAR(40),
insurance_secondary VARCHAR(40),
insurance_tertiary VARCHAR(40),
-- did the provider take insurance and submit on your behalf? possible for them to only submit for primary insurer and require manual submission for secondary/tertiary
have_providersubmitted_primary BOOLEAN,
have_providersubmitted_secondary BOOLEAN,
have_providersubmitted_tertiary BOOLEAN,
-- does customer have copy of invoice for claims purposes? 
have_invoice BOOLEAN,
-- has the claim been submitted by the doctor's office or by the user? should be auto TRUE if doctors office submits.
have_submittedclaim_primary BOOLEAN,
have_submittedclaim_secondary BOOLEAN,
have_submittedclaim_tertiary BOOLEAN,
-- has the user received an EOB from the insurer? it's possible to receive one from the primary and then need to send it on to secondary insurance to start a manual claim
have_eob_primary BOOLEAN,
have_eob_secondary BOOLEAN,
have_eob_tertiary BOOLEAN,
-- has the user received a satisfactory claim response? 
have_completedclaim BOOLEAN,
PRIMARY KEY (healthclaim_id)
);

CREATE TABLE health_providers(
healthprovider_id INT NOT NULL AUTO_INCREMENT,
-- when the provider was added to db
healthprovider_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- updated whever there are changes to the data
ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
dt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
provider_firstname VARCHAR(30) NOT NULL,
provider_lastname VARCHAR(30) NOT NULL,
-- maybe it's possible to have an external database of specialties that feeds into this field? things like internal medicine, family medicine, psychiatrist, OB/GYN, orthopedic surgeon, etc.
provider_specialty VARCHAR(30),
-- healthcare system, ie Seton, St. David's, independent
provider_network VARCHAR(30),
-- does the provider take insurance True/False? 
insurance_accepted BOOLEAN,
-- would be great to have a dropdown list...but instead we can just have people enter a string
insurance_types VARCHAR(60),
PRIMARY KEY (healthprovider_id)
);

-- all of the stuff below is placeholder for if we add a rebate tracking feature
CREATE TABLE rebate_claims(
rebateclaim_id INT NOT NULL AUTO_INCREMENT,
ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
dt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
purchase_date DATE,
purchase_description VARCHAR(20),
purchase_cost VARCHAR(11),
rebate_amount VARCHAR(11),
have_receipt BOOLEAN,
have_claimform BOOLEAN,
have_submittedclaim BOOLEAN,
have_acknowledgedreceipt BOOLEAN,
have_receivedrebate BOOLEAN,
PRIMARY KEY (rebateclaim_id)
);