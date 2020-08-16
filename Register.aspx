<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <style type="text/css">
       body{
			margin: 0;
			/*background: url(https://wallpaperscraft.com/image/book_glasses_tea_chair_cup_garden_80317_1366x768.jpg);*/
			background-size: 100% 100%;
			background-repeat: no-repeat;
			background-attachment: fixed;
			height: 100vh;
		}
        .style3
        {
            height: 61px;
            font-size: 50px;
            width: 767px;
        }
        .style7
        {
            width: 296px;
            height: 808px;
        }
        .style8
        {
            width: 767px;
            height: 808px;
        }
        .style11
    {
        width: 350px;
    }
    .style12
    {
        font-family: Algerian;
        width: 1065px;
    }
    #Select1
    {
        width: 275px;
    }
    .style13
    {
        width: 140px;
        font-weight: bold;
        font-size: x-large;
    }
    .style14
    {
        width: 115px;
    }
        #SelectPassCondition
        {
            width: 276px;
        }
    
    </style>
</head>
<body>
    <form id="form1" action="">
    <div style="height: 800px; margin-bottom: 32px;">    
        <table style="width: 100%; height: 800px;" border="0">
            <tr>
                <td bgcolor="#CACFD2" class="style3" colspan="2">
                    <span style="font-size: 50px"><center class="style12">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Image ID="Image1" runat="server" Height="40px" ImageAlign="AbsMiddle" 
                            ImageUrl="~/Images/Buttons/Register Now.png" Width="148px" />
                        Registration Form</span></td>
            </tr>
            <tr>
                <td class="style7">
                </td>
                <td class="style8" valign="top">
                    <table style="width:100%;" border="0">
                        <tr>
                            <td class="style13" colspan="2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style13">
                                First Name:</td>
                            <td class="style11">
                                <asp:TextBox ID="TextBoxFN" runat="server" Width="270px" MaxLength="30"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBoxFN" ErrorMessage="Please Enter Your First Name" 
                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="True" 
                                    style="font-size: large">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                    ControlToValidate="TextBoxFN" ErrorMessage="Use only English alphabets" 
                                    Font-Bold="True" ForeColor="Red" style="font-size: large" 
                                    ValidationExpression="[a-zA-Z]*$">Use only English alphabets</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                Last Name:</td>
                            <td class="style11">
                                <asp:TextBox ID="TextBoxLN" runat="server" Width="270px" MaxLength="30"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TextBoxLN" ErrorMessage="Please Enter Your Last Name" 
                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="True" 
                                    style="font-size: large">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                    ControlToValidate="TextBoxLN" ErrorMessage="Use only English alphabets" 
                                    Font-Bold="True" ForeColor="Red" style="font-size: large" 
                                    ValidationExpression="[a-zA-Z]*$">Use only English alphabets</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                User Name:</td>
                            <td class="style11">
                                <asp:TextBox ID="TextBoxUN" runat="server" Width="270px" MaxLength="20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="TextBoxUN" ErrorMessage="Please Enter User Name" 
                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="True" 
                                    style="font-size: large">*</asp:RequiredFieldValidator>
                                    <asp:Button ID="ButtonAvailability" runat="server" 
                                    Text="Check Availability" onclick="ButtonAvailability_Click" 
                                    CausesValidation="False"/>
                                    <asp:Label ID="LabelStatus" runat="server" ForeColor="#FF3300" 
                                    Visible="False" Font-Bold="True" Font-Underline="True" style="font-size: large"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                E-mail:</td>
                            <td class="style11">
                                <asp:TextBox ID="TextBoxEM" runat="server" Width="270px" Height="22px" 
                                    MaxLength="40"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="TextBoxEM" ErrorMessage="Please Enter Your Email" 
                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="True" 
                                    style="font-size: large">*</asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                    runat="server" ControlToValidate="TextBoxEM" 
                                    ErrorMessage="Please enter a valid Email ID" Font-Size="20px" ForeColor="Red" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    Font-Bold="True" style="font-size: large"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                Password:</td>
                            <td class="style11">
                                <asp:TextBox ID="TextBoxPass" runat="server" Width="270px" TextMode="Password" 
                                    MaxLength="20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="TextBoxPass" ErrorMessage="Please Enter Password" 
                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="True" 
                                    style="font-size: large">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="TextBoxPass" 
                                    ErrorMessage="Please fullfill all password conditions" Font-Size="20px" 
                                    ForeColor="Red" 
                                    
                                    
                                    ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%]).{6,20})" 
                                    Font-Bold="True" style="font-size: large"></asp:RegularExpressionValidator>
                                <select id="SelectPassCondition" name="D1">                                  
                                    <option value="" disabled selected>1. must contains one digit from 0-9</option>
                                    <option value="" disabled selected>2. must contains one lowercase characters</option>
                                    <option value="" disabled selected>3. must contains one uppercase characters</option>
                                    <option value="" disabled selected>4. must contains one special symbols in the list "!@#$%"</option>
                                    <option value="" disabled selected>5. length at least 6 characters and maximum of 20</option>
                                    <option value="" disabled selected>Password Conditions</option>
                                </select>
                            </tr>
                        <tr>
                            <td class="style13">
                                Confirm Password:</td>
                            <td class="style11">
                                <asp:TextBox ID="TextBoxCP" runat="server" Width="270px" TextMode="Password" 
                                    MaxLength="20"></asp:TextBox>  
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="TextBoxCP" ErrorMessage="Please Re-enter Password" 
                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="True" 
                                    style="font-size: large">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToCompare="TextBoxPass" ControlToValidate="TextBoxCP" 
                                    ErrorMessage="Please enter same password as above" Font-Size="20px" 
                                    ForeColor="Red" Font-Bold="True" style="font-size: large"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                Address:</td>
                            <td class="style11">
                                <asp:TextBox ID="TextBoxAdd" runat="server" TextMode="MultiLine" Width="270px" 
                                    MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                    ControlToValidate="TextBoxAdd" ErrorMessage="Please Select Your City" 
                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="True" 
                                    style="font-size: large">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                City:</td>
                            <td class="style11">
                                <asp:DropDownList ID="DropDownListCity" runat="server" Width="275px">
                                    <asp:ListItem>--------select--------</asp:ListItem>
                                    <asp:ListItem>Mumbai</asp:ListItem>
                                    <asp:ListItem>Delhi</asp:ListItem>
                                    <asp:ListItem>Bangalore</asp:ListItem>
                                    <asp:ListItem>Hyderabad</asp:ListItem>
                                    <asp:ListItem>Ahmedabad</asp:ListItem>
                                    <asp:ListItem>Chennai</asp:ListItem>
                                    <asp:ListItem>Kolkata</asp:ListItem>
                                    <asp:ListItem>Surat</asp:ListItem>
                                    <asp:ListItem>Pune</asp:ListItem>
                                    <asp:ListItem>Jaipur</asp:ListItem>
                                    <asp:ListItem>Lucknow</asp:ListItem>
                                    <asp:ListItem>Kanpur</asp:ListItem>
                                    <asp:ListItem>Nagpur</asp:ListItem>
                                    <asp:ListItem>Visakhapatnam</asp:ListItem>
                                    <asp:ListItem>Indore	</asp:ListItem>
                                    <asp:ListItem>Thane</asp:ListItem>
                                    <asp:ListItem>Bhopal</asp:ListItem>
                                    <asp:ListItem>Pimpri-Chinchwad</asp:ListItem>
                                    <asp:ListItem>Patna</asp:ListItem>
                                    <asp:ListItem>Vadodara</asp:ListItem>
                                    <asp:ListItem>Ghaziabad</asp:ListItem>
                                    <asp:ListItem>Ludhiana</asp:ListItem>
                                    <asp:ListItem>Coimbatore[</asp:ListItem>
                                    <asp:ListItem>Agra</asp:ListItem>
                                    <asp:ListItem>Madurai[</asp:ListItem>
                                    <asp:ListItem>Nashik</asp:ListItem>
                                    <asp:ListItem>Faridabad</asp:ListItem>
                                    <asp:ListItem>Meerut</asp:ListItem>
                                    <asp:ListItem>Rajkot</asp:ListItem>
                                    <asp:ListItem>Kalyan-Dombivali</asp:ListItem>
                                    <asp:ListItem>Vasai-Virar</asp:ListItem>
                                    <asp:ListItem>Varanasi</asp:ListItem>
                                    <asp:ListItem>Srinagar</asp:ListItem>
                                    <asp:ListItem>Aurangabad</asp:ListItem>
                                    <asp:ListItem>Dhanbad</asp:ListItem>
                                    <asp:ListItem>Amritsar</asp:ListItem>
                                    <asp:ListItem>Navi Mumbai</asp:ListItem>
                                    <asp:ListItem>Allahabad</asp:ListItem>
                                    <asp:ListItem>Ranchi</asp:ListItem>
                                    <asp:ListItem>Howrah (city area)</asp:ListItem>
                                    <asp:ListItem>Jabalpur</asp:ListItem>
                                    <asp:ListItem>Gwalior</asp:ListItem>
                                    <asp:ListItem>Vijayawada</asp:ListItem>
                                    <asp:ListItem Value="Jodhpur">Jodhpur</asp:ListItem>
                                    <asp:ListItem>Raipur</asp:ListItem>
                                    <asp:ListItem>Kota[</asp:ListItem>
                                    <asp:ListItem>Guwahati</asp:ListItem>
                                    <asp:ListItem>Chandigarh</asp:ListItem>
                                    <asp:ListItem>Solapur</asp:ListItem>
                                    <asp:ListItem>Hubballi-Dharwad</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="DropDownListCity" ErrorMessage="Please Select Your City" 
                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="True" 
                                    style="font-size: large">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                State:</td>
                            <td class="style11">
                                <asp:DropDownList ID="DropDownListState" runat="server" Width="275px">
                                    <asp:ListItem>--------select--------</asp:ListItem>
                                    <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                    <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                    <asp:ListItem>Assam</asp:ListItem>
                                    <asp:ListItem>Bihar</asp:ListItem>
                                    <asp:ListItem>Chhattisgarh</asp:ListItem>
                                    <asp:ListItem>Goa</asp:ListItem>
                                    <asp:ListItem>Gujarat</asp:ListItem>
                                    <asp:ListItem>Haryana</asp:ListItem>
                                    <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                    <asp:ListItem>Jammu &amp; Kashmir</asp:ListItem>
                                    <asp:ListItem>Jharkhand</asp:ListItem>
                                    <asp:ListItem>Karnataka</asp:ListItem>
                                    <asp:ListItem>Kerala</asp:ListItem>
                                    <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                    <asp:ListItem>Maharashtra</asp:ListItem>
                                    <asp:ListItem>Manipur</asp:ListItem>
                                    <asp:ListItem>Meghalaya</asp:ListItem>
                                    <asp:ListItem>Mizoram</asp:ListItem>
                                    <asp:ListItem>Nagaland</asp:ListItem>
                                    <asp:ListItem>Odisha</asp:ListItem>
                                    <asp:ListItem>Punjab</asp:ListItem>
                                    <asp:ListItem>Rajasthan</asp:ListItem>
                                    <asp:ListItem>Sikkim</asp:ListItem>
                                    <asp:ListItem>Tamil Nadu</asp:ListItem>
                                    <asp:ListItem>Telangana</asp:ListItem>
                                    <asp:ListItem>Tripura</asp:ListItem>
                                    <asp:ListItem>Uttarakhand</asp:ListItem>
                                    <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                    <asp:ListItem>West Bengal</asp:ListItem>
                                    <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                                    <asp:ListItem>Chandigarh</asp:ListItem>
                                    <asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
                                    <asp:ListItem>Daman &amp; Diu</asp:ListItem>
                                    <asp:ListItem>The Government of NCT of Delhi</asp:ListItem>
                                    <asp:ListItem>Lakshadweep</asp:ListItem>
                                    <asp:ListItem>Puducherry </asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="DropDownListState" ErrorMessage="Please Select Your State" 
                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="True" 
                                    style="font-size: large">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                Pin Code:</td>
                            <td class="style11">
                                <asp:TextBox ID="TextBoxPin" runat="server" Width="270px" MaxLength="6"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ControlToValidate="TextBoxPin" ErrorMessage="Please Enter Your Pin Code" 
                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="True" 
                                    style="font-size: large">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter correct pin code"
                        ForeColor="Red" ControlToValidate="TextBoxPin" ValidationExpression="\d{6}" Font-Names="Baskerville Old Face"
                        Font-Size="Large" Font-Bold="True"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                Mobile No.:</td>
                            <td class="style11">
                                <asp:TextBox ID="TextBoxMob" runat="server" Width="270px" MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                    ControlToValidate="TextBoxMob" ErrorMessage="Please Enter Your Mobile Number" 
                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="True" 
                                    style="font-size: large">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                        ErrorMessage="*Invalid Contact number" ForeColor="Red" ControlToValidate="TextBoxMob"
                        ValidationExpression="^[789][0-9]{9}"
                        Font-Names="Baskerville Old Face" Font-Size="Large" Font-Bold="True"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                Date Of Birth:</td>
                            <td class="style11">
                                <asp:TextBox ID="TextBoxDOB" runat="server" Width="270px" MaxLength="10"></asp:TextBox>
                                <asp:Label ID="Label2" runat="server" Text="DD/MM/YYYY Format"></asp:Label>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                    ErrorMessage="Please select proper date" Font-Size="20px" ForeColor="Red" 
                                    MaximumValue="01/01/2001" MinimumValue="01/01/1918" Type="Date" 
                                    ControlToValidate="TextBoxDOB" Font-Bold="True" style="font-size: large"></asp:RangeValidator>                               
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                Gender:</td>
                            <td class="style11">
                                <asp:DropDownList ID="DropDownListGender" runat="server" Width="275px">
                                    <asp:ListItem>--------select--------</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                &nbsp;</td>
                            <td class="style11">
                                <asp:ImageButton ID="Butreg" runat="server" Height="60px" 
                                    ImageUrl="~/Images/Buttons/Register.png" onclick="Butreg_Click" 
                                    Width="120px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:ImageButton ID="Butclear" runat="server" Height="60px" 
                                    ImageUrl="~/Images/Buttons/Reset.png" onclick="Butclear_Click" 
                                    Width="120px" CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                &nbsp;</td>
                            <td class="style11">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                    DisplayMode="List" Font-Size="20px" ForeColor="Red" Height="61px" 
                                    Width="534px" Font-Bold="True" style="font-size: large" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
</asp:Content>

