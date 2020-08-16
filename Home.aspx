<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>
<html>
<head>
    <title>Image Slider</title>
    <style type="text/css">
        s10
        {
            font-size: 55px;
            font-family: Algerian;
            }
        .font
        {
            background-color: #CACFD2;
            }
        body{
			margin: 0;
			background: url(HomeBackground.jpg);
			background-size: 100% 100%;
			background-attachment: fixed;
			height: 100vh;
		}
    </style>
	<link href="ImageSlider.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="font">
	    <s10><center>Welcome to The BookShelf !</center></s10>
    </div>
	<div id="container">
		<div class="images"><ul>
				<li><img src="Images/BookSlide/1.png" alt="1"/></li>
				<li><img src="Images/BookSlide/2.jpg" alt="2"/></li>
				<li><img src="Images/BookSlide/3.jpg" alt="3"/></li>
				<li><img src="Images/BookSlide/4.jpg" alt="4"/></li>
				<li><img src="Images/BookSlide/5.jpg" alt="5"/></li>
				<li><img src="Images/BookSlide/6.jpg" alt="6"/></li>
				<li><img src="Images/BookSlide/7.jpg" alt="7"/></li>
				<li><img src="Images/BookSlide/8.jpg" alt="8"/></li>
				<li><img src="Images/BookSlide/9.jpg" alt="9"/></li>
				<li><img src="Images/BookSlide/10.jpg" alt="10"/></li>
				<li><img src="Images/BookSlide/11.jpg" alt="11"/></li>
			</ul>
		</div>
		<div class="bullets">
			<div>
			    <span><img src="Images/BookSlide/Thumbnails/1.png" alt="1"/>1</span>
			    <span><img src="Images/BookSlide/Thumbnails/2.jpg" alt="2"/>2</span>
			    <span><img src="Images/BookSlide/Thumbnails/3.jpg" alt="3"/>3</span>
			    <span><img src="Images/BookSlide/Thumbnails/4.jpg" alt="4"/>4</span>
			    <span><img src="Images/BookSlide/Thumbnails/5.jpg" alt="5"/>5</span>
			    <span><img src="Images/BookSlide/Thumbnails/6.jpg" alt="6"/>6</span>
			    <span><img src="Images/BookSlide/Thumbnails/7.jpg" alt="7"/>7</span>
			    <span><img src="Images/BookSlide/Thumbnails/8.jpg" alt="8"/>8</span>
			    <span><img src="Images/BookSlide/Thumbnails/9.jpg" alt="9"/>9</span>
			    <span><img src="Images/BookSlide/Thumbnails/10.jpg" alt="10"/>10</span>
			    <span><img src="Images/BookSlide/Thumbnails/11.jpg" alt="11"/>11</span>
		    </div>
		</div>
	    <div class="shadow">
	    </div>
    </div>
</body>
</html>
</asp:Content>

