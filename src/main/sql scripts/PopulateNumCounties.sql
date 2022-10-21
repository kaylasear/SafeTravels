USE safetravelsapplication;

UPDATE stateprofile as sp, (select StateProfileId, count(CountyName) as NumCounties
 from countyprofile
 group by StateProfileId) as cp
set sp.NumCounties = cp.NumCounties
where sp.ProfileId = cp.StateProfileId