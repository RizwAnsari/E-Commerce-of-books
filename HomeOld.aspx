<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="HomeOld.aspx.cs" Inherits="HomeOld" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!DOCTYPE html>
<html>
<head>
	<title>Image Slider</title>
    <style>
        s10
        {
            font-size: 55px;
            font-family: Algerian;
            }
        .font
        {
            background-color: #CACFD2;
            }
    </style>
    <link href="StyleSheet/ImageSlider.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="font">
	<s10><center>Welcome to The BookShelf !</center></s10>
    </div>
	<div class="slider">
		<figure>
			<div class="slide">
				<img src="Images/BookSlide/1.png" alt=""/>
			</div>
			<div class="slide">
				<img src="Images/BookSlide/2.jpg" alt=""/>
			</div>
			<div class="slide">
				<img src="Images/BookSlide/3.jpg" alt=""/>
			</div>	
			<div class="slide">
				<img src="Images/BookSlide/6.jpg" alt=""/>
			</div>
			<div class="slide">
				<img src="Images/BookSlide/10.jpg" alt=""/>
			</div>
		</figure>
	</div>
</body>
</html>
</asp:Content>

