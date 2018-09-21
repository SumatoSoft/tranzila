def token_good_response
  'TranzilaTK=W18c88122e42afe2312'
end

def token_bad_response
  <<~HTML
    <html>
      <head>
        <title>Tranzila Alert</title>
        <meta name="robots" content="noindex, nofollow">
        <meta http-equiv="pragma" content="no-cache">
      </head>
      <body>
        <br><br><br>
        <table align="center" width="250" cellspacing="0" cellpadding="0" border="1">
          <tr>
            <td><img src="/images/tranzila-alert.jpg" width="250" height="85" border="0"></td>
          </tr>
          <tr bgcolor=ffffa0>
            <td>
              <table width=100% border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td size=10>&nbsp;</td>
                  <td><font size=4><br><b>Error Message:<br><font color=red>Unknown merchant.</font></font></b><br><br>Please use the BACK button in your browser.</td>
                  <td size=10>&nbsp;</td>
                  </td>
                </tr>
              </table>
          </tr>
          </td>
        </table>
      </body>
    </html>
  HTML
end

def charge_code_response_response
  'Response=036&cred_type=1&DclickTK=&supplier=test&TranzilaTK=W18c88122e42afe2312' \
    '&expdate=0917&sum=15&currency=1&ConfirmationCode=0000000&index=30&Responsesource=0&Responsecvv=0' \
    '&Responseid=0&Tempref=03410001&DBFIsForeign=0&DBFcard=5&cardtype=5&DBFcardtype=1&cardissuer=1' \
    '&DBFsolek=0&cardaquirer=0&tz_parent=xtest'
end

def charge_good_response
  'Response=000&cred_type=1&DclickTK=&supplier=test&TranzilaTK=W18c88122e42afe2312' \
    '&expdate=0917&sum=15currency=1&ConfirmationCode=0000000&index=30&Responsesource=0&Responsecvv=0' \
    '&Responseid=0&Tempref=03410001&DBFIsForeign=0&DBFcard=5&cardtype=5&DBFcardtype=1&cardissuer=1' \
    '&DBFsolek=0&cardaquirer=0&tz_parent=xtest'
end

def charge_bad_response
  <<~HTML
    <html>
      <head>
        <title>Tranzila Alert</title>
        <meta name="robots" content="noindex, nofollow">
        <meta http-equiv="pragma" content="no-cache">
      </head>
      <body>
        <br><br><br>
        <table align="center" width="250" cellspacing="0" cellpadding="0" border="1">
          <tr>
            <td><img src="/images/tranzila-alert.jpg" width="250" height="85" border="0"></td>
          </tr>
          <tr bgcolor=ffffa0>
            <td>
              <table width=100% border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td size=10>&nbsp;</td>
                  <td><font size=4><br><b>Error Message:<br><font color=red>Not Authorized</font></font></b><br><br>Please use the BACK button in your browser.</td>
                  <td size=10>&nbsp;</td>
                  </td>
                </tr>
              </table>
          </tr>
          </td>
        </table>
      </body>
    </html>
  HTML
end

def refund_good_response
  'Response=000&TranzilaTK=W18c88122e42afe2312&DclickTK=&authnr=0000000&supplier=test' \
    '&tranmode=C75&sum=15&ConfirmationCode=0000000&index=76&Responsesource=0&Responsecvv=0' \
    '&Responseid=0&Tempref=04900001&DBFIsForeign=0&DBFcard=5&cardtype=5&DBFcardtype=1&cardissuer=1'\
    '&DBFsolek=1&cardaquirer=1&tz_parent=test'
end

def refund_bad_response
  <<~HTML
    <html>
       <head>
          <title>Tranzila Alert</title>
          <meta name="robots" content="noindex, nofollow">
          <meta http-equiv="pragma" content="no-cache">
       </head>
       <body>
          <br><br><br>
          <table align="center" width="250" cellspacing="0" cellpadding="0" border="1">
             <tr>
                <td><img src="/images/tranzila-alert.jpg" width="250" height="85" border="0"></td>
             </tr>
             <tr bgcolor=ffffa0>
                <td>
                   <table width=100% border="0" cellspacing="0" cellpadding="0">
                      <tr>
                         <td size=10>&nbsp;</td>
                         <td><font size=4><br><b>Error Message:<br><font color=red>Invalid Credit Sum</font></font></b><br><br>Please use the BACK button in your browser.</td>
                         <td size=10>&nbsp;</td>
                         </td>
                      </tr>
                   </table>
             </tr>
             </td>
          </table>
       </body>
    </html>
  HTML
end
