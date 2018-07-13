-- views to "denormalize" data
-- apply with: 
-- psql nacmis -f views.sql

create or replace view vw_stakeholderdirectory as
  select st.*, pr.name as province_name, ds.name as district_name
  from data_entry_stakeholderdirectory st
  left outer join data_entry_province pr 
    on pr.id = st.organisation_province_id
  left outer join data_entry_district ds
    on ds.id = st.organisation_district_id; 

create or replace view vw_organisationtarget as
  select st.*, ot.organisation_target_option
  from data_entry_stakeholderdirectory_organisation_targets stot
  left outer join data_entry_organisationtarget ot 
    on ot.id = stot.organisationtarget_id
  left outer join vw_stakeholderdirectory st
    on st.id = stot.stakeholderdirectory_id;

create or replace view vw_activityreportform as
  select st.*, 
    arf.report_date as activityreportform_report_date, 
    arf.quarter_been_reported as activityreportform_quarter_been_reported, 
    arf.name as activityreportform_name,
    arf.telephone_number as activityreportform_telephone_number, 
    arf.email_address as activityreportform_email_address, 
    arf.id as activityreportform_id
  from data_entry_activityreportform arf
  left outer join vw_stakeholderdirectory st
    on st.id = arf.stake_holder_name_id;

-- join child tables with vw_activityreportform

create or replace view vw_condomprogramming as
  select ac.*,
    co.id as condomprogramming_id,
    co.condom_dist_point_num
  from data_entry_condomprogramming co
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = co.activity_form_id;

create or replace view vw_condomprogramming2 as
  select ac.*,
    co.id as condomprogramming2_id,
    co.female_condom_distributed_num,
    co.male_condom_distributed_num
  from data_entry_condomprogramming2 co
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = co.activity_form_id;

create or replace view vw_dacavalidation as
  select ac.*,
    dv.id as dacavalidation_id,
    dv.validation_date as dacavalidation_date,
    dv.form_validated,
    dv.validated_by_id
  from data_entry_dacavalidation dv
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = dv.activity_form_id;

create or replace view vw_experiencedphysicalviolence as
  select ac.*,
    ex.id as experiencedphysicalviolence_id,
    ex.physical_female_less_10,
    ex.physical_female_10_14,
    ex.physical_female_15_19,
    ex.physical_female_20_24,
    ex.physical_female_25_plus,
    ex.physical_male_less_10,
    ex.physical_male_10_14,
    ex.physical_male_15_19,
    ex.physical_male_20_24,
    ex.physical_male_25_plus
  from data_entry_experiencedphysicalviolence ex
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = ex.activity_form_id;
    
create or replace view vw_experiencedsexualviolence as
  select ac.*,
    ex.id as experiencedsexualviolence_id,
    ex.sexual_female_less_10,
    ex.sexual_female_10_14,
    ex.sexual_female_15_19,
    ex.sexual_female_20_24,
    ex.sexual_female_25_plus,
    ex.sexual_male_less_10,
    ex.sexual_male_10_14,
    ex.sexual_male_15_19,
    ex.sexual_male_20_24,
    ex.sexual_male_25_plus
  from data_entry_experiencedsexualviolence ex
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = ex.activity_form_id;

create or replace view vw_iecmaterial as
  select ac.*,
    im.id as iecmaterial_id,
    im.material_type as iecmaterial_type,
    im.number_distributed as iecmaterial_number_distributed,
    im.localized as iecmaterial_localized
  from data_entry_iecmaterial im
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = im.activity_form_id;

create or replace view vw_iecmaterial2 as
  select ac.*,
    im.id as iecmaterial2_id
  from data_entry_iecmaterial2 im
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = im.activity_form_id;

create or replace view vw_individualcurrentlyenrolled as
  select ac.*,
    ice.id as individualcurrentlyenrolled_id,
    ice.individuals_enrolled_female_10_14,
    ice.individuals_enrolled_female_15_19,
    ice.individuals_enrolled_female_20_24,
    ice.individuals_enrolled_female_25_plus,
    ice.individuals_enrolled_male_10_14,
    ice.individuals_enrolled_male_15_19,
    ice.individuals_enrolled_male_20_24,
    ice.individuals_enrolled_male_25_plus
  from data_entry_individualcurrentlyenrolled ice
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = ice.activity_form_id;

create or replace view vw_inmate as
  select ac.*,
    im.id as inmate_id,
    im.inmates_female_num,
    im.inmates_male_num
  from data_entry_inmate im
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = im.activity_form_id;

create or replace view vw_menwithmen as
  select ac.*,
    mm.id as menwithmen_id,
    mm.men_with_men
  from data_entry_menwithmen mm
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = mm.activity_form_id;

create or replace view vw_mobilepopulation as
  select ac.*,
    mp.id as mobilepopulation_id
  from data_entry_mobilepopulation mp
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = mp.activity_form_id;

create or replace view vw_mobileworker as
  select ac.*,
    mw.id as mobileworker_id,
    mw.mobile_workers_female_num,
    mw.mobile_workers_male_num
  from data_entry_mobileworker mw
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = mw.activity_form_id;

create or replace view vw_outofschool as
  select ac.*,
    oos.id as outofschool_id,
    oos.out_school_female_10_14,
    oos.out_school_female_15_19,
    oos.out_school_female_20_24,
    oos.out_school_male_10_14,
    oos.out_school_male_15_19,
    oos.out_school_male_20_24
  from data_entry_outofschool oos
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = oos.activity_form_id;

create or replace view vw_peoplewhoinjectdrug as
  select ac.*,
    pd.id as peoplewhoinjectdrug_id,
    pd.pwid_female,
    pd.pwid_male
  from data_entry_peoplewhoinjectdrug pd
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = pd.activity_form_id;

create or replace view vw_personswithdisability as
  select ac.*,
    pd.id as personswithdisability_id,
    pd.pwd_female_num,
    pd.pwd_male_num
  from data_entry_personswithdisabilty pd
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = pd.activity_form_id;

create or replace view vw_postexposureprophylaxis as
  select ac.*,
    pp.id as postexposureprophylaxis_id,
    pp.accessed_pep_female_less_10,
    pp.accessed_pep_female_10_14,
    pp.accessed_pep_female_15_19,
    pp.accessed_pep_female_20_24,
    pp.accessed_pep_female_25_plus,
    pp.accessed_pep_male_less_10,
    pp.accessed_pep_male_10_14,
    pp.accessed_pep_male_15_19,
    pp.accessed_pep_male_20_24,
    pp.accessed_pep_male_25_plus
  from data_entry_postexposureprophylaxis pp
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = pp.activity_form_id;

create or replace view vw_preexposureprophylaxis as
  select ac.*,
    pp.id as preexposureprophylaxis_id,
    pp.referred_pep_female_15_19,
    pp.referred_pep_female_20_24,
    pp.referred_pep_female_25_plus,
    pp.referred_pep_male_15_19,
    pp.referred_pep_male_20_24,
    pp.referred_pep_male_25_plus
  from data_entry_preexposureprophylaxis pp
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = pp.activity_form_id;

create or replace view vw_reportedcase as
  select ac.*,
    rc.id as reportedcase_id,
    rc.reported_female_less_10,
    rc.reported_female_10_14,
    rc.reported_female_15_19,
    rc.reported_female_20_24,
    rc.reported_female_25_plus,
    rc.reported_male_less_10,
    rc.reported_male_10_14,
    rc.reported_male_15_19,
    rc.reported_male_20_24,
    rc.reported_male_25_plus
  from data_entry_reportedcase rc
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = rc.activity_form_id;

create or replace view vw_sexworker as
  select ac.*,
    sw.id as sexworker_id,
    sw.sex_workers_female_10_14,
    sw.sex_workers_female_15_19,
    sw.sex_workers_female_20_24,
    sw.sex_workers_female_25_29,
    sw.sex_workers_female_30_34,
    sw.sex_workers_female_35_plus,
    sw.sex_workers_male_10_14,
    sw.sex_workers_male_15_19,
    sw.sex_workers_male_20_24,
    sw.sex_workers_male_25_29,
    sw.sex_workers_male_30_34,
    sw.sex_workers_male_35_plus
  from data_entry_sexworker sw
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = sw.activity_form_id;

create or replace view vw_supportandcare as
  select ac.*,
    sc.id as supportandcare_id
  from data_entry_supportandcare sc
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = sc.activity_form_id;

create or replace view vw_supportgroupsetup as
  select ac.*,
    s.id as supportgroupsetup_id,
    s.support_groups
  from data_entry_supportgroupsetup s
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = s.activity_form_id;

create or replace view vw_synergydevelopmentsector as
  select ac.*,
    s.id as synergydevelopmentsector_id,
    s.employees_reached_female_num,
    s.employees_reached_male_num
  from data_entry_synergydevelopmentsector s
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = s.activity_form_id;

create or replace view vw_teachers as
  select ac.*,
    t.id as teachers_id,
    t.teachers_female,
    t.teachers_male
  from data_entry_teachers t
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = t.activity_form_id;

create or replace view vw_transgenderindividual as
  select ac.*,
    t.id as transgenderindividual_id,
    t.transgender_num
  from data_entry_transgenderindividual t
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = t.activity_form_id;

create or replace view vw_vulnerablepeople as
  select ac.*,
    vp.id as vulnerablepeople_id,
    vp.ovc_female_10_14,
    vp.ovc_female_15_19,
    vp.ovc_female_20_24,
    vp.ovc_female_25_plus,
    vp.ovc_male_10_14,
    vp.ovc_male_15_19,
    vp.ovc_male_20_24,
    vp.ovc_male_25_plus
  from data_entry_vulnerablepeople vp
  left outer join vw_activityreportform ac
    on ac.activityreportform_id = vp.activity_form_id;

-- join with vw_organisationtarget

/*create or replace view vw_endofyearquestion as
  select o.*,
    q.funding,
    q.number_of_meetings_daft,
    q.number_of_meetings_paft,
    q.id as endofyearquestion_id
  from data_entry_endofyearquestion q
  left outer join vw_organisationtarget o 
    on o.id = q.organisation_id;
*/

create or replace view vw_fundingsource as
  select o.*,
    f.name_of_organisation,
    f.funding_amount,
    f.id as fundingsource_id
  from data_entry_fundingsource f
  left outer join vw_organisationtarget o
    on o.id = f.organisation_id;

create or replace view vw_generalcomment as
  select o.*,
    g.general_comment,
    g.id as generalcomment_id
  from data_entry_generalcomment g
  left outer join vw_organisationtarget o
    on o.id = g.organisation_id;

create or replace view vw_generalcomment2 as
  select o.*,
    g.general_comment,
    g.id as generalcomment_id
  from data_entry_generalcomment2 g
  left outer join vw_organisationtarget o
    on o.id = g.organisation_id;

/*create or replace view vw_otherquestion as
  select o.*,
    oq.action_plan,
    oq.workplace_programme,
    oq.sources_of_information,
    oq.m_and_person,
    oq.id as otherquestion_id
  from data_entry_otherquestion oq
  left outer join vw_organisationtarget o
    on o.id = oq.organisation_id;
*/

create or replace view vw_programactivity as
  select o.*,
    p.id as programactivity_id,
    w.name as ward_name
  from data_entry_programactivity p
  left outer join vw_organisationtarget o
    on o.id = p.organisation_id
  left outer join data_entry_ward w
    on p.ward_id = w.id;

create or replace view vw_targetgrouppreventionmessage as
  select o.*,
    t.id as targetgrouppreventionmessage_id,
    t.prevention_message
  from data_entry_targetgrouppreventionmessage t
  left outer join vw_organisationtarget o
    on o.id = t.organisation_id;


create or replace view vw_mobilepopulation_types as
  select mp.*,
    m2m_mobile_types.id as m2m_id,
    mpt.mobile_population_type,
    m2m_mobile_types.mobilepopulationtype_id
  from data_entry_mobilepopulation_mobile_population_types m2m_mobile_types
  left outer join vw_mobilepopulation mp on mp.mobilepopulation_id = m2m_mobile_types.mobilepopulation_id
  left outer join data_entry_mobilepopulationtype mpt on mpt.id = m2m_mobile_types.mobilepopulationtype_id;
