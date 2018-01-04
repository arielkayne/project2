DROP DATABASE IF EXISTS claimsy_db;

CREATE DATABASE claimsy_db;

USE claimsy_db;

CREATE TABLE users(
user_id INT NOT NULL AUTO_INCREMENT,
user_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
modified_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
modified_dt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
username VARCHAR(30) NOT NULL,
passwd VARCHAR(30) NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
email VARCHAR(30) NOT NULL,
birthday DATE,
postal_code_us VARCHAR(5),
PRIMARY KEY (user_id)
);

CREATE TABLE health_claims(
healthclaim_id INT NOT NULL AUTO_INCREMENT,
healthclaim_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
dt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
service_date DATE,
provider_firstname VARCHAR(30) NOT NULL,
provider_lastname VARCHAR(30) NOT NULL,
patient_firstname VARCHAR(30) NOT NULL,
patient_lastname VARCHAR(30) NOT NULL,
treatment_type VARCHAR(30),
treatment_outpatient BOOLEAN DEFAULT FALSE,
treatment_inpatient BOOLEAN DEFAULT FALSE,
treatment_notes VARCHAR(511),
payment_pos VARCHAR(11),
payment_invoiced VARCHAR(11),
insurance_primary VARCHAR(40),
insurance_secondary VARCHAR(40),
insurance_tertiary VARCHAR(40),
have_providersubmitted_primary BOOLEAN,
have_providersubmitted_secondary BOOLEAN,
have_providersubmitted_tertiary BOOLEAN,
have_invoice BOOLEAN,
have_submittedclaim_primary BOOLEAN,
have_submittedclaim_secondary BOOLEAN,
have_submittedclaim_tertiary BOOLEAN,
have_eob_primary BOOLEAN,
have_eob_secondary BOOLEAN,
have_eob_tertiary BOOLEAN,
have_completedclaim BOOLEAN,
PRIMARY KEY (healthclaim_id)
);

CREATE TABLE health_providers(
healthprovider_id INT NOT NULL AUTO_INCREMENT,
healthprovider_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
dt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
provider_firstname VARCHAR(30) NOT NULL,
provider_lastname VARCHAR(30) NOT NULL,
provider_specialty VARCHAR(30),
provider_network VARCHAR(30),
insurance_accepted BOOLEAN,
insurance_types VARCHAR(60),
PRIMARY KEY (healthprovider_id)
);

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