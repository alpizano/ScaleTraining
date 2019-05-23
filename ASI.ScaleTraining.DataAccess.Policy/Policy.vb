﻿' Copyright (c) 2009 Applied Systems, Inc.
Option Explicit On
Option Strict On

Imports ASI.ScaleTraining.DataAccess.Common

''' <summary>
'''   This class implements the data access layer for policies.
''' </summary>
''' <remarks>
'''   None
''' </remarks>
Public Class Policy

#Region " Methods - Fetch "

  ''' <summary>
  '''   Queries the database for a list of policies based on a client ID.
  ''' </summary>
  ''' <param name="iEntityID">
  '''   Integer containing the client ID.
  ''' </param>
  ''' <returns>
  '''   DataTable containing a collection of matching policies.
  ''' </returns>
  ''' <remarks>
  '''   None
  ''' </remarks>
  Public Function Fetch(ByVal iEntityID As Integer) As DataTable

    Dim sSQL As String = " SELECT p.uniqpolicy, l.uniqline, t.cdpolicylinetypecode AS line, " & _
                         "        c.descriptionof AS statusdescription, p.effectivedate, " & _
                         "        p.expirationdate, p.policynumber, p.descriptionof AS policydescription " & _
                         " FROM policy p " & _
                         " INNER JOIN line l ON l.uniqpolicy = p.uniqpolicy " & _
                         " INNER JOIN cdpolicylinetype t ON t.uniqcdpolicylinetype = l.uniqcdpolicylinetype " & _
                         " INNER JOIN cdlinestatus c ON c.uniqcdlinestatus = l.uniqcdlinestatus " & _
                         " WHERE p.uniqentity = " & iEntityID
    Return ExecuteDataTable(sSQL)

  End Function

  ''' <summary>
  '''   Queries the database for detail information based on a line ID.
  ''' </summary>
  ''' <param name="iLineID">
  '''   Integer containing the line ID.
  ''' </param>
  ''' <returns>
  '''   DataTable containing the detail information.
  ''' </returns>
  ''' <remarks>
  '''   None
  ''' </remarks>
  Public Function FetchPolicyDetail(ByVal iLineID As Integer) As DataTable

    Dim sSQL As String = " SELECT p.uniqpolicy, p.billedcommission, p.billedpremium, " & _
                         "        p.annualizedcommission, p.annualizedpremium " & _
                         " FROM policy p " & _
                         " INNER JOIN line l ON l.uniqpolicy = p.uniqpolicy " & _
                         " WHERE l.uniqline = " & iLineID
    Return ExecuteDataTable(sSQL)

  End Function

  ''' <summary>
  '''   Queries the database for detail information based on a line ID.
  ''' </summary>
  ''' <param name="iLineID">
  '''   Integer containing the line ID.
  ''' </param>
  ''' <returns>
  '''   DataTable containing the detail information.
  ''' </returns>
  ''' <remarks>
  '''   None
  ''' </remarks>
  Public Function FetchLineDetail(ByVal iLineID As Integer) As DataTable

    Dim sSQL As String = " SELECT l.uniqline, l.cdstatecodeissuing AS issuingstate, " & _
                         "        l.contactnamebillto, l.address1billto, l.address2billto, " & _
                         "        l.address3billto, l.citybillto, l.cdstatecodebillto, " & _
                         "        l.postalcodebillto, l.countybillto, l.cdcountrycodebillto, " & _
                         "        l.email, l.fax, l.faxextension, " & _
                         "        c.cdpolicylinetypecode, f.descriptionof AS formcategory,  " & _
                         "        b.nameof AS billingcompany, i.nameof AS issuingcompany " & _
                         " FROM line l " & _
                         " INNER JOIN cdpolicylinetype c ON c.uniqcdpolicylinetype = l.uniqcdpolicylinetype " & _
                         " INNER JOIN formcategory f ON f.uniqformcategory = l.uniqformcategory " & _
                         " INNER JOIN company b ON b.uniqentity = l.uniqentitycompanybilling " & _
                         " INNER JOIN company i ON i.uniqentity = l.uniqentitycompanyissuing " & _
                         " WHERE l.uniqline = " & iLineID
    Return ExecuteDataTable(sSQL)

  End Function

#End Region

#Region " Methods - Save "

  ''' <summary>
  '''   Renews a policy by changing the effective date to today and changing
  '''   the expiration date to match the current policy term length.  As an example,
  '''   a policy that is currently six months long would be updated to have an
  '''   effective date of today and an expiration date of six months in the future.
  ''' </summary>
  ''' <param name="iPolicyID">
  '''   Integer containing the policy ID.
  ''' </param>
  ''' <returns>
  '''   Boolean value indicating if the renewal was successful or not.
  ''' </returns>
  ''' <remarks>
  '''   This function omits many steps required to renew a policy, but it
  '''   illustrates the concept of a renewal by updating the effective and
  '''   expiration dates.
  ''' </remarks>
  Public Function Renew(ByVal iPolicyID As Integer) As Boolean

    Dim sSQL As String = " UPDATE policy " & _
                         " SET effectivedate = DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0), " & _
                         "     expirationdate = DATEADD(MONTH, DATEDIFF(MONTH, effectivedate, expirationdate), DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0)) " & _
                         " WHERE uniqpolicy = " & iPolicyID
    Return (ExecuteCommand(sSQL) > 0)

  End Function

#End Region

#Region " Methods - Security Check "

  ''' <summary>
  '''   Determines if a particular user has rights to view a particular policy.
  ''' </summary>
  ''' <param name="iPolicyID">
  '''   Integer containing the policy ID.
  ''' </param>
  ''' <param name="sUserCode">
  '''   String containing the user code.
  ''' </param>
  ''' <returns>
  '''   DataTable containing a single record with one column representing either
  '''   True (1) or False (0).
  ''' </returns>
  ''' <remarks>
  '''   None
  ''' </remarks>
  Public Function CheckPolicySecurity(ByVal iPolicyID As Integer, ByVal sUserCode As String) As DataTable

    Dim sSQL As String = " SELECT COUNT(*) AS countof " & _
                         " FROM securityuser u " & _
                         " INNER JOIN securityuserstructurecombinationjt jt ON jt.uniqsecurityuser =  u.uniqsecurityuser " & _
                         " INNER JOIN structurecombination s ON  s.uniqstructure = jt.uniqstructure " & _
                         " INNER JOIN policy p ON p.uniqagency = s.uniqagency AND " & _
                         "                        p.uniqbranch = s.uniqbranch AND " & _
                         "                        p.uniqdepartment = s.uniqdepartment " & _
                         " WHERE u.usercode = '" & ToDBString(sUserCode) & "' and " & _
                         "       p.uniqpolicy =  " & iPolicyID
    Return ExecuteDataTable(sSQL)

  End Function

#End Region

End Class