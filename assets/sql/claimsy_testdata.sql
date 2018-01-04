select * from users;

INSERT INTO `users` (`username`, `passwd`, `first_name`, `last_name`, `email`, `birthday`, `postal_code_us`)
VALUES
	('firsttimer','unsafepw','Joseph','Schmosef','ihavemail@noob.com', '1944-02-12', 19713),
	('avguser','asafeishpw!2','Mika','Jerbanovich','problems@gotsome.com', '1985-07-04', 10001);

select * from health_claims;

INSERT INTO `health_claims` (`service_date`, `provider_firstname`, `provider_lastname`, `patient_firstname`, `patient_lastname`, `treatment_type`, `treatment_outpatient`, `treatment_inpatient`, `treatment_notes`, `payment_pos`, `payment_invoiced`, `insurance_primary`, `insurance_secondary`, `insurance_tertiary`, `have_providersubmitted_primary`, `have_providersubmitted_secondary`, `have_providersubmitted_tertiary`, `have_invoice`, `have_submittedclaim_primary`, `have_submittedclaim_secondary`,`have_submittedclaim_tertiary`, `have_eob_primary`, `have_eob_secondary`, `have_eob_tertiary`, `have_completedclaim`)
VALUES
	('2017-10-02','Jackson','Pollack','Joseph','Schmosef', 'Doctor Visit', FALSE, TRUE, 'The doctor evaluated a crzy rash on my neck.', '25', '0', 'Seton Select', null, null, TRUE, null, null, FALSE, TRUE, null, null, FALSE, null, null, FALSE),
	('2018-01-02','Havea','Lollipop','Mika','Jerbanovich', 'Specialist Visit', FALSE, TRUE, 'Needed more pills.', '100', '0', 'Crappy Insurance Co', null, null, FALSE, null, null, TRUE, FALSE, null, null, FALSE, null, null, FALSE);

select * from health_providers;

INSERT INTO `health_providers` (`provider_firstname`, `provider_lastname`, `provider_specialty`, `provider_network`, `insurance_accepted`, `insurance_types`)
VALUES
	('Jackson','Pollack', 'Family Medicine', 'Seton', TRUE, 'Blue Cross, Aetna, Seton'),
	('Havea', 'Lollipop', 'Psychiatry', 'FlyByNight', FALSE, null);