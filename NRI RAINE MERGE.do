* Import the "County Joined Layer.csv" file
import delimited "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\County Joined Layer.csv"

* Keep only the observations for specific states
keep if stateabbrv == "CT" | stateabbrv == "MA" | stateabbrv == "ME" | stateabbrv == "NH" | stateabbrv == "RI" | stateabbrv == "VT"

* Keep only the desired variables
keep nri_id state stateabbrv statefips county countytype countyfips stcofips tract tractfips population agrivalue area buildvalue risk_value risk_score risk_ratng eal_score eal_ratng eal_spctl sovi_score sovi_ratng sovi_spctl resl_score resl_ratng resl_spctl name program narrative feature impacts community county_2 stateabbrv_2 year url plan_type town_id plandoc_id shape_area shape_leng

* Save the dataset as "County Joined Layer.dta"
save "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\County Joined Layer.dta"

* Clear the memory
clear

* Import the "State Joined Layer.csv" file
import delimited "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\State Joined Layer.csv"

* Keep only the observations for specific states
keep if stateabbrv == "CT" | stateabbrv == "MA" | stateabbrv == "ME" | stateabbrv == "NH" | stateabbrv == "RI" | stateabbrv == "VT"

* Keep only the desired variables
keep nri_id state stateabbrv statefips county countytype countyfips stcofips tract tractfips population agrivalue area buildvalue risk_value risk_score risk_ratng eal_score eal_ratng eal_spctl sovi_score sovi_ratng sovi_spctl resl_score resl_ratng resl_spctl name program narrative feature impacts community county_2 stateabbrv_2 year url plan_type town_id plandoc_id shape_area shape_leng

* Save the dataset as "State Joined Layer.dta"
save "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\State Joined Layer.dta"

* Clear the memory
clear

* Use the "County Joined Layer.dta" dataset
use "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\County Joined Layer.dta"

* Append the "State Joined Layer.dta" dataset to the "County Joined Layer.dta" dataset
append using "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\State Joined Layer.dta", generate(appended)

* Display the frequency of the "appended" variable
tab appended

* Display the frequency of the "community" variable
tab community

* Save the dataset as "Census Tract Unit Data.dta"
save "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\Census Tract Unit Data.dta"


***DUMMY ALL STRINGS***
* Create dummy variables for each impact category
generate i_air_q_indoor = strpos(impacts, "Air Quality: Indoor") > 0
generate i_air_q_outdoor = strpos(impacts, "Air Quality: Outdoor") > 0
generate i_air_temp = strpos(impacts, "Air Temperature") > 0
generate i_drought = strpos(impacts, "Drought") > 0
generate i_ecosystems = strpos(impacts, "Ecosystems") > 0
generate i_erosion = strpos(impacts, "Erosion") > 0
generate i_extreme_cold = strpos(impacts, "Extreme Cold") > 0
generate i_extreme_heat = strpos(impacts, "Extreme Heat") > 0
generate i_extreme_storm = strpos(impacts, "Extreme Storm Event") > 0
generate i_flooding = strpos(impacts, "Flooding") > 0
generate i_ocean_acid = strpos(impacts, "Ocean Acidification") > 0
generate i_precipitation = strpos(impacts, "Precipitation") > 0
generate i_salt_water_intrusion = strpos(impacts, "Salt Water Intrusion") > 0
generate i_sea_level_rise = strpos(impacts, "Sea Level Rise") > 0
generate i_seasonal_shift = strpos(impacts, "Seasonal Shift") > 0
generate i_storm_surge = strpos(impacts, "Storm Surge") > 0
generate i_wind = strpos(impacts, "Wind") > 0
generate i_vector = strpos(impacts, "Vector") > 0

* Drop the original "impacts" variable 
drop impacts


* Create dummy variables for each feature category
gen fea_coastal_dummy = strpos(feature, "Coastal") > 0
gen fea_eco_cost_benefit_dummy = strpos(feature, "Economic - Cost/Benefit Analysis") > 0
gen fea_eco_resilience_dummy = strpos(feature, "Economic - Resilience") > 0
gen fea_eco_eco_services_dummy = strpos(feature, "Economic - Ecosystem Services") > 0
gen fea_resp_emergency_dummy = strpos(feature, "Response - Emergency/Disaster/Preparedness/Mitigation") > 0
gen fea_infra_green_dummy = strpos(feature, "Infrastructure - Green") > 0
gen fea_eco_agri_forestry_dummy = strpos(feature, "Ecosystems - Agriculture/Forestry") > 0
gen fea_eco_coastal_protection_dummy = strpos(feature, "Ecosystems - Coastal Protection") > 0
gen fea_eco_nat_resources_dummy = strpos(feature, "Ecosystems - Natural Resources") > 0
gen fea_eco_riverine_issues_dummy = strpos(feature, "Ecosystems - Riverine Issues") > 0
gen fea_eco_soils_dummy = strpos(feature, "Ecosystems - Soils") > 0
gen fea_gov_bylaws_dummy = strpos(feature, "Government - Bylaws/Ordinances/Codes") > 0
gen fea_gov_ghg_dummy = strpos(feature, "Government - Greenhouse Gas Mitigation") > 0
gen fea_gov_land_use_dummy = strpos(feature, "Government - Land Use Regulations") > 0
gen fea_infra_built_dummy = strpos(feature, "Infrastructure - Built") > 0
gen fea_infra_comm_dummy = strpos(feature, "Infrastructure - Communication") > 0
gen fea_infra_drinking_dummy = strpos(feature, "Infrastructure - Drinking Water") > 0
gen fea_infra_energy_dummy = strpos(feature, "Infrastructure - Energy") > 0
gen fea_infra_solid_waste_dummy = strpos(feature, "Infrastructure - Solid Waste") > 0
gen fea_infra_storm_water_dummy = strpos(feature, "Infrastructure - Storm Water") > 0
gen fea_infra_transport_dummy = strpos(feature, "Infrastructure - Transportation") > 0
gen fea_infra_waste_water_dummy = strpos(feature, "Infrastructure - Waste Water") > 0
gen fea_resp_dam_safety_dummy = strpos(feature, "Response - Dam Safety") > 0
gen fea_resp_debris_mgmt_dummy = strpos(feature, "Response - Debris Management") > 0
gen fea_soc_cult_historical_dummy = strpos(feature, "Social - Cultural/Historical Resources") > 0
gen fea_soc_housing_dummy = strpos(feature, "Social - Housing") > 0
gen fea_soc_outreach_dummy = strpos(feature, "Social - Outreach/Communication/Education") > 0
gen fea_soc_pub_health_dummy = strpos(feature, "Social - Public Health") > 0
gen fea_soc_vulnerable_dummy = strpos(feature, "Social - Vulnerable Populations") > 0

* Drop the original "feature" variable 
drop feature

* Create dummy variables for each plan type category
gen ptype_adapt_dummy = strpos(plan_type, "Adaptation Plan") > 0
gen ptype_cap_impr_dummy = strpos(plan_type, "Capital Improvements Plan") > 0
gen ptype_case_dummy = strpos(plan_type, "Case Study") > 0
gen ptype_climate_action_dummy = strpos(plan_type, "Climate Action Plan") > 0
gen ptype_climate_mitigation_dummy = strpos(plan_type, "Climate Mitigation Document") > 0
gen ptype_coastal_dummy = strpos(plan_type, "Coastal Plan") > 0
gen ptype_disaster_rec_dummy = strpos(plan_type, "Disaster Recovery Plan") > 0
gen ptype_eco_dev_dummy = strpos(plan_type, "Economic Development Plan or Strategy") > 0
gen ptype_emergency_dummy = strpos(plan_type, "Emergency Response Plan") > 0
gen ptype_evacuation_dummy = strpos(plan_type, "Evacuation Plan") > 0
gen ptype_fema_hazard_dummy = strpos(plan_type, "FEMA–Hazard/Multi-Hazard Mitigation") > 0
gen ptype_floodplain_dummy = strpos(plan_type, "Floodplain Management Plan") > 0
gen ptype_harbor_mgmt_dummy = strpos(plan_type, "Harbor Management Plan") > 0
gen ptype_hist_pres_dummy = strpos(plan_type, "Historic Preservation Plan") > 0
gen ptype_measurement_dummy = strpos(plan_type, "Measurement and Evaluation") > 0
gen ptype_municipal_dummy = strpos(plan_type, "Municipal Master or Comprehensive Plan") > 0
gen ptype_open_space_dummy = strpos(plan_type, "Open Space Plan") > 0
gen ptype_presentation_dummy = strpos(plan_type, "Presentation") > 0
gen ptype_resilience_dummy = strpos(plan_type, "Resilience Plan") > 0
gen ptype_storm_water_dummy = strpos(plan_type, "Storm Water Plan") > 0
gen ptype_transport_dummy = strpos(plan_type, "Transportation Plan") > 0
gen ptype_vulnerability_dummy = strpos(plan_type, "Vulnerability Assessment") > 0

* Drop the original "plan_type" variable 
drop plan_type

* Create dummy variables for each community category
gen comm_state_dummy = community == "state"
gen comm_org_dummy = community == "organization"
gen comm_watershed_dummy = community == "watershed"
gen comm_town_dummy = community == "town"

* Drop the original "community" variable if no longer needed
drop community

* Save the dataset with the new dummy variables

save "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\dummied strings.dta"




*** This data allows us to analyze whether various impacts, features, plan types, and plan juristiction of adaptation policies predicts inreased resilience 

clear

use "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\dummied strings.dta"

* Sort the data by state, county, and town_id
sort state county town_id

* Collapse the data by state, county, and town_id while preserving variables
collapse (mean) year population buildvalue agrivalue risk_value risk_score  eal_score  eal_spctl sovi_score  sovi_spctl resl_score  resl_spctl (sum) i_air_q_indoor i_air_q_outdoor i_air_temp i_drought i_ecosystems i_erosion i_extreme_cold i_extreme_heat i_extreme_storm i_flooding i_ocean_acid i_precipitation i_salt_water_intrusion i_sea_level_rise i_seasonal_shift i_storm_surge i_wind i_vector fea_coastal_dummy fea_eco_cost_benefit_dummy fea_eco_resilience_dummy fea_eco_eco_services_dummy fea_resp_emergency_dummy fea_infra_green_dummy fea_eco_agri_forestry_dummy fea_eco_coastal_protection_dummy fea_eco_nat_resources_dummy fea_eco_riverine_issues_dummy fea_eco_soils_dummy fea_gov_bylaws_dummy fea_gov_ghg_dummy fea_gov_land_use_dummy fea_infra_built_dummy fea_infra_comm_dummy fea_infra_drinking_dummy fea_infra_energy_dummy fea_infra_solid_waste_dummy fea_infra_storm_water_dummy fea_infra_transport_dummy fea_infra_waste_water_dummy fea_resp_dam_safety_dummy fea_resp_debris_mgmt_dummy fea_soc_cult_historical_dummy fea_soc_housing_dummy fea_soc_outreach_dummy fea_soc_pub_health_dummy fea_soc_vulnerable_dummy ptype_adapt_dummy ptype_cap_impr_dummy ptype_case_dummy ptype_climate_action_dummy ptype_climate_mitigation_dummy ptype_coastal_dummy ptype_disaster_rec_dummy ptype_eco_dev_dummy ptype_emergency_dummy ptype_evacuation_dummy ptype_fema_hazard_dummy ptype_floodplain_dummy ptype_harbor_mgmt_dummy ptype_hist_pres_dummy ptype_measurement_dummy ptype_municipal_dummy ptype_open_space_dummy ptype_presentation_dummy ptype_resilience_dummy ptype_storm_water_dummy ptype_transport_dummy ptype_vulnerability_dummy comm_state_dummy comm_org_dummy comm_watershed_dummy comm_town_dummy, by(state county town_id)

gen yearssincepolicy = 2023-year

*by sub-unit based on RAINE

save "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\town,county,state collapse.dta", replace


***Repeat but by census tract

clear

use "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\dummied strings.dta"
sort tract

collapse (mean) year population buildvalue agrivalue risk_value risk_score  eal_score  eal_spctl sovi_score  sovi_spctl resl_score  resl_spctl (sum) i_air_q_indoor i_air_q_outdoor i_air_temp i_drought i_ecosystems i_erosion i_extreme_cold i_extreme_heat i_extreme_storm i_flooding i_ocean_acid i_precipitation i_salt_water_intrusion i_sea_level_rise i_seasonal_shift i_storm_surge i_wind i_vector fea_coastal_dummy fea_eco_cost_benefit_dummy fea_eco_resilience_dummy fea_eco_eco_services_dummy fea_resp_emergency_dummy fea_infra_green_dummy fea_eco_agri_forestry_dummy fea_eco_coastal_protection_dummy fea_eco_nat_resources_dummy fea_eco_riverine_issues_dummy fea_eco_soils_dummy fea_gov_bylaws_dummy fea_gov_ghg_dummy fea_gov_land_use_dummy fea_infra_built_dummy fea_infra_comm_dummy fea_infra_drinking_dummy fea_infra_energy_dummy fea_infra_solid_waste_dummy fea_infra_storm_water_dummy fea_infra_transport_dummy fea_infra_waste_water_dummy fea_resp_dam_safety_dummy fea_resp_debris_mgmt_dummy fea_soc_cult_historical_dummy fea_soc_housing_dummy fea_soc_outreach_dummy fea_soc_pub_health_dummy fea_soc_vulnerable_dummy ptype_adapt_dummy ptype_cap_impr_dummy ptype_case_dummy ptype_climate_action_dummy ptype_climate_mitigation_dummy ptype_coastal_dummy ptype_disaster_rec_dummy ptype_eco_dev_dummy ptype_emergency_dummy ptype_evacuation_dummy ptype_fema_hazard_dummy ptype_floodplain_dummy ptype_harbor_mgmt_dummy ptype_hist_pres_dummy ptype_measurement_dummy ptype_municipal_dummy ptype_open_space_dummy ptype_presentation_dummy ptype_resilience_dummy ptype_storm_water_dummy ptype_transport_dummy ptype_vulnerability_dummy comm_state_dummy comm_org_dummy comm_watershed_dummy comm_town_dummy, by(tract)

gen yearssincepolicy = 2023-year

*by census tract based on NRI (FEMA)

save "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\tract collapse.dta", replace


***Do more adaptation policies predict community resilience?***

clear

use "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\dummied strings.dta"
sort state county town_id
duplicates report plandoc_id state county town_id
* Keep only the first occurrence of each observation
bysort plandoc_id state county town_id: keep if _n == 1
collapse (mean) year population buildvalue agrivalue risk_value risk_score  eal_score  eal_spctl sovi_score  sovi_spctl resl_score  resl_spctl (sum) i_air_q_indoor i_air_q_outdoor i_air_temp i_drought i_ecosystems i_erosion i_extreme_cold i_extreme_heat i_extreme_storm i_flooding i_ocean_acid i_precipitation i_salt_water_intrusion i_sea_level_rise i_seasonal_shift i_storm_surge i_wind i_vector fea_coastal_dummy fea_eco_cost_benefit_dummy fea_eco_resilience_dummy fea_eco_eco_services_dummy fea_resp_emergency_dummy fea_infra_green_dummy fea_eco_agri_forestry_dummy fea_eco_coastal_protection_dummy fea_eco_nat_resources_dummy fea_eco_riverine_issues_dummy fea_eco_soils_dummy fea_gov_bylaws_dummy fea_gov_ghg_dummy fea_gov_land_use_dummy fea_infra_built_dummy fea_infra_comm_dummy fea_infra_drinking_dummy fea_infra_energy_dummy fea_infra_solid_waste_dummy fea_infra_storm_water_dummy fea_infra_transport_dummy fea_infra_waste_water_dummy fea_resp_dam_safety_dummy fea_resp_debris_mgmt_dummy fea_soc_cult_historical_dummy fea_soc_housing_dummy fea_soc_outreach_dummy fea_soc_pub_health_dummy fea_soc_vulnerable_dummy ptype_adapt_dummy ptype_cap_impr_dummy ptype_case_dummy ptype_climate_action_dummy ptype_climate_mitigation_dummy ptype_coastal_dummy ptype_disaster_rec_dummy ptype_eco_dev_dummy ptype_emergency_dummy ptype_evacuation_dummy ptype_fema_hazard_dummy ptype_floodplain_dummy ptype_harbor_mgmt_dummy ptype_hist_pres_dummy ptype_measurement_dummy ptype_municipal_dummy ptype_open_space_dummy ptype_presentation_dummy ptype_resilience_dummy ptype_storm_water_dummy ptype_transport_dummy ptype_vulnerability_dummy comm_state_dummy comm_org_dummy comm_watershed_dummy comm_town_dummy  (count) policy_count = plandoc_id, by(state county town_id)
gen yearssincepolicy = 2023-year

save "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\policycollapse_town.dta", replace


clear

use "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\dummied strings.dta"
sort tract
duplicates report plandoc_id tract
* Keep only the first occurrence of each observation
bysort plandoc_id tract: keep if _n == 1
collapse (mean) year population buildvalue agrivalue risk_value risk_score  eal_score  eal_spctl sovi_score  sovi_spctl resl_score  resl_spctl (sum) i_air_q_indoor i_air_q_outdoor i_air_temp i_drought i_ecosystems i_erosion i_extreme_cold i_extreme_heat i_extreme_storm i_flooding i_ocean_acid i_precipitation i_salt_water_intrusion i_sea_level_rise i_seasonal_shift i_storm_surge i_wind i_vector fea_coastal_dummy fea_eco_cost_benefit_dummy fea_eco_resilience_dummy fea_eco_eco_services_dummy fea_resp_emergency_dummy fea_infra_green_dummy fea_eco_agri_forestry_dummy fea_eco_coastal_protection_dummy fea_eco_nat_resources_dummy fea_eco_riverine_issues_dummy fea_eco_soils_dummy fea_gov_bylaws_dummy fea_gov_ghg_dummy fea_gov_land_use_dummy fea_infra_built_dummy fea_infra_comm_dummy fea_infra_drinking_dummy fea_infra_energy_dummy fea_infra_solid_waste_dummy fea_infra_storm_water_dummy fea_infra_transport_dummy fea_infra_waste_water_dummy fea_resp_dam_safety_dummy fea_resp_debris_mgmt_dummy fea_soc_cult_historical_dummy fea_soc_housing_dummy fea_soc_outreach_dummy fea_soc_pub_health_dummy fea_soc_vulnerable_dummy ptype_adapt_dummy ptype_cap_impr_dummy ptype_case_dummy ptype_climate_action_dummy ptype_climate_mitigation_dummy ptype_coastal_dummy ptype_disaster_rec_dummy ptype_eco_dev_dummy ptype_emergency_dummy ptype_evacuation_dummy ptype_fema_hazard_dummy ptype_floodplain_dummy ptype_harbor_mgmt_dummy ptype_hist_pres_dummy ptype_measurement_dummy ptype_municipal_dummy ptype_open_space_dummy ptype_presentation_dummy ptype_resilience_dummy ptype_storm_water_dummy ptype_transport_dummy ptype_vulnerability_dummy comm_state_dummy comm_org_dummy comm_watershed_dummy comm_town_dummy  (count) policy_count = plandoc_id, by(tract)
gen yearssincepolicy = 2023-year

save "C:\Users\elisa\OneDrive\Desktop\Climate Vulnerability Data\policycollapse_tract.dta", replace


***Tract version allows us to exploit more variation/statistical power while town/county/state version allows us to map more intuitively
































