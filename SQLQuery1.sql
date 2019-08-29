use ScaleTraining

SELECT *
FRom Policy p

SELECT *
FROM Line l

--Client
--Click Locate button
SELECT c.uniqentity, c.lookupcode, c.nameof, 
        c.flags, a.address1, a.address2, 
        a.city, a.cdstatecode, a.postalcode  
FROM client c  
INNER JOIN contactaddress a ON a.uniqcontactaddress = c.uniqcontactaddressaccount  
WHERE c.lookupcode LIKE 'ocea%' 

--Policy
--Click Policy button OCEAPRO-29
SELECT p.uniqpolicy, l.uniqline, t.cdpolicylinetypecode AS line, 
        c.descriptionof AS statusdescription, p.effectivedate, 
        p.expirationdate, p.policynumber, p.descriptionof AS policydescription 
FROM policy p 
INNER JOIN line l ON l.uniqpolicy = p.uniqpolicy 
INNER JOIN cdpolicylinetype t ON t.uniqcdpolicylinetype = l.uniqcdpolicylinetype 
INNER JOIN cdlinestatus c ON c.uniqcdlinestatus = l.uniqcdlinestatus 
WHERE p.uniqentity = 93458

--Policy
--Click Policy button OCEAVIL-1
SELECT p.uniqpolicy, l.uniqline, t.cdpolicylinetypecode AS line, 
c.descriptionof AS statusdescription, p.effectivedate,
p.expirationdate, p.policynumber, p.descriptionof AS policydescription  
FROM policy p  INNER JOIN line l ON l.uniqpolicy = p.uniqpolicy  
INNER JOIN cdpolicylinetype t ON t.uniqcdpolicylinetype = l.uniqcdpolicylinetype 
INNER JOIN cdlinestatus c ON c.uniqcdlinestatus = l.uniqcdlinestatus  
WHERE p.uniqentity = 93475

--Check Login Security
SELECT *
FROM SecurityUser

SELECT    TypeCode                                 
FROM      SecurityUser 
WHERE     UserCode = 'TestUser'

SELECT    TypeCode                                 
FROM      SecurityUser 
WHERE     UserCode = 'EnterpriseAdmin'

Select COUNT(*) As countof 
FROM securityuser u 
INNER JOIN securityuserstructurecombinationjt jt On jt.uniqsecurityuser =  u.uniqsecurityuser 
INNER JOIN structurecombination s On  s.uniqstructure = jt.uniqstructure 
INNER JOIN policy p On p.uniqagency = s.uniqagency And p.uniqbranch = s.uniqbranch And 
p.uniqdepartment = s.uniqdepartment 
WHERE u.usercode = 'TestUser' --
--and p.uniqpolicy =  " & iPolicyID

SELECT COUNT(*) As CountOf
FROM SecurityUser u
INNER JOIN securityuserstructurecombinationjt jt On jt.uniqsecurityuser = u.uniqsecurityuser 
INNER JOIN structurecombination s On s.uniqstructure = jt.uniqstructure 
INNER JOIN policy p On p.uniqagency = s.uniqagency And p.uniqbranch = s.uniqbranch And p.uniqdepartment = s.uniqdepartment 

SELECT * 
FROM SecurityUser u
INNER JOIN securityuserstructurecombinationjt jt On jt.uniqsecurityuser = u.uniqsecurityuser 
INNER JOIN structurecombination s On s.uniqstructure = jt.uniqstructure 
INNER JOIN policy p On p.uniqagency = s.uniqagency And p.uniqbranch = s.uniqbranch And p.uniqdepartment = s.uniqdepartment 

SELECT *
FROM SecurityUserStructureCombinationJT jt
INNER JOIN structurecombination s  On  s.uniqstructure = jt.uniqstructure 
INNER JOIN policy p On p.uniqagency = s.uniqagency And p.uniqbranch = s.uniqbranch And p.uniqdepartment = s.uniqdepartment 


SELECT COUNT(*) 
FROM Policy p

SELECT *
FROM SecurityUser

SELECT * 
FROM SecurityUserStructureCombinationJT

SELECT * 
FROM StructureCombination
WHERE UniqStructure = 65541

SELECT * 
FROM Policy p
WHERE UniqPolicy = 65541

-- TestUser, OCEAVIL-01
 SELECT p.uniqpolicy, l.uniqline, t.cdpolicylinetypecode AS line,        
  c.descriptionof AS statusdescription, p.effectivedate,      
     p.expirationdate, p.policynumber, p.descriptionof AS policydescription  
	 FROM policy p  INNER JOIN line l ON l.uniqpolicy = p.uniqpolicy 
	  INNER JOIN cdpolicylinetype t ON t.uniqcdpolicylinetype = l.uniqcdpolicylinetype  
	  INNER JOIN cdlinestatus c ON c.uniqcdlinestatus = l.uniqcdlinestatus  
	  WHERE p.uniqentity = 93475

Select COUNT(*) As countof 
FROM securityuser u  
INNER JOIN securityuserstructurecombinationjt jt On jt.uniqsecurityuser =  u.uniqsecurityuser
INNER JOIN structurecombination s On  s.uniqstructure = jt.uniqstructure 
INNER JOIN policy p On p.uniqagency = s.uniqagency And p.uniqbranch = s.uniqbranch
And  p.uniqdepartment = s.uniqdepartment  
WHERE u.usercode = 'EnterpriseAdmin' and p.uniqpolicy =  205492

Select COUNT(*) As countof  
FROM securityuser u  
INNER JOIN securityuserstructurecombinationjt jt On jt.uniqsecurityuser =  u.uniqsecurityuser  
INNER JOIN structurecombination s On  s.uniqstructure = jt.uniqstructure  
INNER JOIN policy p On p.uniqagency = s.uniqagency And p.uniqbranch = s.uniqbranch And p.uniqdepartment = s.uniqdepartment  
WHERE u.usercode = 'TestUser' and p.uniqpolicy =  205501

Select COUNT(*) As countof  
FROM securityuser u  
INNER JOIN securityuserstructurecombinationjt jt On jt.uniqsecurityuser =  u.uniqsecurityuser 
INNER JOIN structurecombination s On  s.uniqstructure = jt.uniqstructure 
INNER JOIN policy p On p.uniqagency = s.uniqagency And p.uniqbranch = s.uniqbranch And p.uniqdepartment = s.uniqdepartment  
WHERE u.usercode = 'TestUser' and  p.uniqpolicy =  205517


Select COUNT(*) As countof 
FROM securityuser u 
INNER JOIN securityuserstructurecombinationjt jt On jt.uniqsecurityuser =  u.uniqsecurityuser 
INNER JOIN structurecombination s On  s.uniqstructure = jt.uniqstructure 
INNER JOIN policy p On p.uniqagency = s.uniqagency And p.uniqbranch = s.uniqbranch And p.uniqdepartment = s.uniqdepartment 
WHERE u.usercode = 'TestUser' and p.uniqpolicy =  205527

Select COUNT(*) As countof 
FROM securityuser u 
INNER JOIN securityuserstructurecombinationjt jt On jt.uniqsecurityuser =  u.uniqsecurityuser 
INNER JOIN structurecombination s On  s.uniqstructure = jt.uniqstructure 
INNER JOIN policy p On p.uniqagency = s.uniqagency And p.uniqbranch = s.uniqbranch And p.uniqdepartment = s.uniqdepartment 
WHERE u.usercode = 'TestUser' and p.uniqpolicy =  205555

-- Fetch Policy
 SELECT p.uniqpolicy, l.uniqline, t.cdpolicylinetypecode AS line, 
 c.descriptionof AS statusdescription, p.effectivedate, 
 p.expirationdate, p.policynumber, p.descriptionof AS policydescription 
 FROM policy p 
 INNER JOIN line l ON l.uniqpolicy = p.uniqpolicy 
 INNER JOIN cdpolicylinetype t ON t.uniqcdpolicylinetype = l.uniqcdpolicylinetype 
 INNER JOIN cdlinestatus c ON c.uniqcdlinestatus = l.uniqcdlinestatus 
  WHERE p.uniqentity = 93475

-- FetchComboDetail
SELECT l.uniqline, l.cdstatecodeissuing AS issuingstate,
 c.cdpolicylinetypecode, f.descriptionof As formcategory, 
 b.NameOf As billingcompany, i.NameOf As issuingcompany, 
 p.uniqpolicy, p.billedcommission, p.billedpremium, 
 p.annualizedcommission, p.annualizedpremium 
 FROM line l 
 INNER JOIN cdpolicylinetype c On c.uniqcdpolicylinetype = l.uniqcdpolicylinetype 
 INNER JOIN formcategory f On f.uniqformcategory = l.uniqformcategory 
 INNER JOIN company b On b.uniqentity = l.uniqentitycompanybilling 
 INNER JOIN company i On i.uniqentity = l.uniqentitycompanyissuing 
 INNER JOIN policy p ON l.uniqpolicy = p.uniqpolicy
 WHERE l.uniqline = 105637

 --COmbination
 SELECT p.uniqpolicy ,l.uniqline, l.cdstatecodeissuing AS issuingstate,
 t.cdpolicylinetypecode AS line, c.descriptionof AS statusdescription,
  f.descriptionof As formcategory, b.NameOf As billingcompany, i.NameOf As issuingcompany, 
  p.billedcommission, p.billedpremium, 
 p.annualizedcommission, p.annualizedpremium ,
p.effectivedate, p.expirationdate, p.policynumber, p.descriptionof AS policydescription 
 FROM line l 
 INNER JOIN cdpolicylinetype t On t.uniqcdpolicylinetype = l.uniqcdpolicylinetype 
 INNER JOIN cdlinestatus c ON c.uniqcdlinestatus = l.uniqcdlinestatus 
 INNER JOIN formcategory f On f.uniqformcategory = l.uniqformcategory 
 INNER JOIN company b On b.uniqentity = l.uniqentitycompanybilling 
 INNER JOIN company i On i.uniqentity = l.uniqentitycompanyissuing 
 INNER JOIN policy p ON l.uniqpolicy = p.uniqpolicy
 WHERE p.uniqentity = 93475 --AND l.uniqline = 105637

 SELECT *
 FROM CdPolicyLineType

 SELECT * 
 FROM CdLineStatus