<%@ Page Title="Signup" Language="C#" MasterPageFile="~/General.master"  AutoEventWireup="true" CodeFile="student_sign.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" type="text/css" href="App_Themes/Theme1/CSS/fv.css">
        <script src="App_Themes/Theme1/JS/jquery-1.10.2.js"></script>
        <script src="App_Themes/Theme1/JS/multifield.js"></script>
        <script src="App_Themes/Theme1/JS/validator.js"></script>
        <style type="text/css">
            

#style-1::-webkit-scrollbar-track
{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	background-color: ;
}

#style-1::-webkit-scrollbar
{
	width: 14px;
	border-radius:5px;
	background-color:#F5F5F5 ;
}

#style-1::-webkit-scrollbar-thumb
{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
	background-color: #555;
}

                                                            
         </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style=" opacity:0.9;width:625px; height:495px; position:absolute; top:149px; left:362px; background-image: url('Images/signup.png'); background-size:100% 100%; background-repeat: no-repeat;">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<div id="style-1" style="overflow-y:scroll;height:330px; color: #FFFFFF; font-weight: normal; font-size: large; font-family: Calibri; display: block;margin:0 auto; position:absolute; top:153px; left:62.5px">
 
    <table style="width:100%;text-align :left; margin:auto;">
          <tr>
                <td>
                    Name:
                </td>   
                 <td > 
                    <div class="item">
                   <asp:TextBox width="150px" required="required" data-validate-length-range="2,15" placeholder="First Name" ID="fnameTxt" 
                         runat="server"></asp:TextBox>
                     <asp:TextBox  width="150px" required="required" data-validate-length-range="2,15" placeholder="Middle Name" ID="midnameTxt" 
                         runat="server"></asp:TextBox>
                     <asp:TextBox  width="150px" required="required" data-validate-length-range="2,15" placeholder="Last Name" ID="lastnameTxt" 
                         runat="server"></asp:TextBox></div>
                </td>
            </tr>
            
            <tr>
                <td>
                Enroll ID:
                </td>
                <td><div class="item">
                    <asp:TextBox  class="number" type="number" data-validate-minmax="070000000000,999999999999" required="required" placeholder="e.g. 100010107011" 
                        ID="enrollTxt" runat="server"></asp:TextBox></div>
                </td>
            </tr>
            
            <tr>
                 
                 <td>
                    Username:
                 </td>
                 <td>   
                 <div class="item">
                     <asp:TextBox   placeholder="Username" ID="unameTxt" 
                         runat="server" required="required"  AutoPostBack="True" OnTextChanged="unameTxt_TextChanged"></asp:TextBox>
                     
                     
                     <asp:Image ID="imgcheck" runat="server" 
                         Visible="False" CssClass="img-circle"/>
                     <asp:Label ID="lblcheck" runat="server" Text="Label" Visible="False"></asp:Label>
                  
                    </div>
                   </td> 

            </tr>
                     
            <tr>
                <td>
                Password:
                </td>
                <td>
                <div class="item"> 
                   <asp:TextBox type="password" required="required" data-validate-length-range="6,12" TextMode="Password"   placeholder="Must be of 6 digits" ID="passTxt" 
                        runat="server"></asp:TextBox>
                   
                    <ajaxToolkit:PasswordStrength ID="passTxt_PasswordStrength" runat="server" 
                        Enabled="True" TargetControlID="passTxt" StrengthIndicatorType="BarIndicator" BarBorderCssClass="Bar" PreferredPasswordLength="10" TextStrengthDescriptions="Weak;Average;Good;Bravo" TextStrengthDescriptionStyles="Weak;Average;Good;Bravo">
                    </ajaxToolkit:PasswordStrength>
                   
                     </div>
                </td>
            </tr>

          <tr>
                <td>
                Confirm Password:
                </td>
                <td>
                <div class="item">
                   <asp:TextBox type="password" data-validate-linked="password" required="required" TextMode="Password" placeholder="Confirm Password" 
                        ID="confpassTxt" runat="server"></asp:TextBox>
                     </div>
                </td>
            </tr>
         
           <tr>
                <td>
                Conatct No:
                </td>
                <td>
                <div class="item">
                   <asp:TextBox required="required" data-validate-length-range="10,11" placeholder="Exclude +91" ID="contactTxt" 
                        runat="server"></asp:TextBox>
                     
                     </div>
                </td>
            </tr>

           <tr>
                <td>
                Email Id:
                </td>
                <td>
                <div class="item">
                   <asp:TextBox required="required" type="email" class="email" placeholder="Email Id" ID="emailTxt" 
                        runat="server"></asp:TextBox>
                     </div>
                </td>
            </tr>           

            <tr>
                <td>
                 </td>
                 <td>   
                    <asp:Button class="btn btn-info" ID="studsignupBtn" runat="server" Text="Signup" 
                         Width="93px" Font-Size="Large" onclick="Button1_Click" />
                     <asp:Label ID="Label7" runat="server" Text="Label" 
                         Visible="False"></asp:Label>
                </td>
            </tr>

            
        </table>
      
    </div>
</div>


 
    <script>
        // initialize the validator function
        validator.message['date'] = 'not a real date';

        // validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
        $('form')
                    .on('blur', 'input[required], input.optional, select.required', validator.checkField)
                    .on('change', 'select.required', validator.checkField)
                    .on('keypress', 'input[required][pattern]', validator.keypress);

        $('.multi.required')
                    .on('keyup blur', 'input', function () {
                        validator.checkField.apply($(this).siblings().last()[0]);
                    });

        // bind the validation to the form submit event
        //$('#send').click('submit');//.prop('disabled', true);

        $('form').submit(function (e) {
            e.preventDefault();
            var submit = true;
            // evaluate the form using generic validaing
            if (!validator.checkAll($(this))) {
                submit = false;
            }

            if (submit)
                this.submit();
            return false;
        });

        /* FOR DEMO ONLY */
        $('#vfields').change(function () {
            $('form').toggleClass('mode2');
        }).prop('checked', false);

        $('#alerts').change(function () {
            validator.defaults.alerts = (this.checked) ? false : true;
            if (this.checked)
                $('form .alert').remove();
        }).prop('checked', false);
        </script>
    


 

</asp:Content>

