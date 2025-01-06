<%@ page import="starttup.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css');
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@300..700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Lora:wght@400..700&display=swap');

:root {
  --color-black: #41423d;
  --color-neutral-100: #f5f4f0;
  --color-neutral: #dfddd0;
  --color-primary-100: #f0f7f5;
  --color-primary-200: #e0eeeb;
  --color-primary-300: #cfe5e0;
  --color-primary: #3f9783;
  --color-primary-500: #327969;
  --color-white: #fbfcfa;
  --text-font-family: 'Inter', sans-serif;
  --title-font-family: 'Lora', serif;
  --title-font-weight: 500;
}

* { box-sizing: border-box; margin: 0; padding: 0; }
html { font: normal 16px/1.5 sans-serif; }

body {
  background: var(--color-neutral-100);
  color: var(--color-black);
  font-family: var(--text-font-family);
}

h1 {
  color: var(--color-primary);
  font-family: var(--title-font-family);
  font-size: 2.5rem;
  font-weight: var(--title-font-weight);
  margin: 0;
}

a {
  color: var(--color-primary);
  font-size: .875rem;
  font-weight: 500;
  text-decoration: none;
}
a:hover { color: var(--color-primary-500); }

/*
  main
*/

main {
  align-items: center;
  display: grid;
  min-height: 100vh;
  padding: 2.5rem;
  width: 100%;
}

main .content {
  margin: 0 auto;
  max-width: 1400px;
  width: 100%;
}

.main-header { margin: 0 0 2.5rem; }
.main-header.grid {
  align-items: center;
  display: grid;
  grid-auto-flow: column;
  justify-content: space-between;
}

/*
  buttons
*/

.button {
  background: var(--color-primary);
  border: 0;
  border-radius: .25rem;
  color: var(--color-white);
  cursor: pointer;
  font: inherit;
  font-weight: 500;
  height: 3rem;
  line-height: 3rem;
  padding: 0 2rem;

  /* grid */
  align-items: center;
  display: grid;
  gap: .75rem;
  grid-auto-flow: column;
}
.button:hover { background: var(--color-primary-500); }
.button i { font-size: 1.25rem; }

.button.icon {
  border-radius: 50%;
  justify-content: center;
  overflow: hidden;
  padding: 0;
  width: 3rem;
}

.button.link {
  background: none;
  color: var(--color-primary);
  justify-content: start;
  padding: 0;
}
.button.link:hover { color: var(--color-primary-500); }
.button.link i { font-size: inherit; }

/*
  cards
*/

.card {
  border: 1px solid var(--color-neutral);
  border-radius: .25rem;
  background: var(--color-white);
  margin: 0 0 2.5rem;
  overflow: auto;
  padding: 1.5rem 1.5rem 2.5rem;
  width: 100%;
}

/*
  inputs
*/

.checkbox {
  background: var(--color-white);
  border: 1px solid var(--color-neutral);
  border-radius: .25rem;
  cursor: pointer;
  height: 1.5rem;
  position: relative;
  width: 1.5rem;
}

.checkbox input[type="checkbox"] {
  cursor: pointer;
  height: 0;
  opacity: 0;
  position: relative;
  width: 0;
}

.checkbox .checkmark::after {
  background: var(--color-primary);
  border: 0;
  border-radius: .25rem;
  color: var(--color-white);
  content: "\f00c";
  display: block;
  font-family: "Font Awesome 6 Free";
  font-size: .75rem;
  font-weight: 900;
  height: 1.5rem;
  width: 1.5rem;

  /* grid */
  display: grid;
  align-items: center;
  justify-content: center;

  /* position */
  position: absolute;
  left: -1px;
  top: -1px;
}
.checkbox .checkmark.minus::after { content: "\f068"; }
.checkbox .checkmark { display: none; }
.checkbox input[type="checkbox"]:checked ~ .checkmark { display: block; }

.select {
  background: var(--color-white);
  border: 1px solid var(--color-neutral);
  border-radius: .25rem;
  color: var(--color-black);
  display: inline-block;
  font: inherit;
  height: 3rem;
  margin: 0 1rem 0 0;
  padding: 0 1rem;
  position: relative;
  width: 12rem;
}

.select::after {
  content: "\f107";
  font-family: "Font Awesome 6 Free";
  font-weight: 900;
  height: 3rem;
  line-height: 3rem;
  padding: 0 1rem;
  position: absolute;
  right: 0;
  top: 0;
}

select {
  appearance: none;
  background-color: transparent;
  border: 0;
  cursor: inherit;
  font: inherit;
  height: 3rem;
  margin: 0;
  padding: 0 1rem 0 0;
  width: 100%;
}

input[type="number"],
input[type="text"] {
  background: var(--color-white);
  border: 1px solid var(--color-neutral);
  border-radius: .25rem;
  color: var(--color-black);
  display: inline-block;
  font: inherit;
  height: 3rem;
  margin: 0 .5rem;
  padding: 0 1rem;
  width: 5rem;
}

/*
  colors
*/

.colors {
  display: grid;
  justify-content: start;
  gap: 1.5rem;
  grid-auto-flow: column;
  margin: 2.5rem 0;
}

.color { border-radius: 50%; height: 4rem; width: 4rem; }
.color.black { background: var(--color-black); }
.color.neutral-100 { background: var(--color-neutral-100); border: 1px solid var(--color-neutral); }
.color.neutral { background: var(--color-neutral); }
.color.primary-100 { background: var(--color-primary-100); border: 1px solid var(--color-primary-300); }
.color.primary-200 { background: var(--color-primary-200); border: 1px solid var(--color-primary-300); }
.color.primary-300 { background: var(--color-primary-300); }
.color.primary { background: var(--color-primary); }
.color.primary-500 { background: var(--color-primary-500); }
.color.white { background: var(--color-white); border: 1px solid var(--color-neutral); }

/*
  paging
*/

.paging.grid {
  align-items: center;
  display: grid;
  gap: .75rem;
  grid-auto-flow: column;
}

.paging span { margin: 0 .75rem; }

/*
  table
*/

table { border-collapse: collapse; width: 100%; }
td, th {
  border-bottom: 1px solid var(--color-primary-300);
  font-size: 1rem;
  text-align: left;
  white-space: nowrap;
}
th { padding: 1.5rem 1rem; }
td { padding: 1rem; }

tbody tr { cursor: pointer; }
tbody tr.selected td { background: var(--color-primary-200); }
tbody tr:hover:not(.selected) td,
tbody tr.hover:not(.selected) td {
  background: var(--color-primary-100);
}

.table-footer, .table-header { font-size: .875rem; }
.table-footer { margin: -1.5rem 0 0; }
.table-header { margin: 0 0 1rem; }

.table-footer.grid,
.table-header.grid {
  align-items: center;
  display: grid;
  grid-auto-flow: column;
  justify-content: space-between;
}
button
{
width:100px;
outline:none;
border:none;
Background:var(--color-primary);
height:30px;
border-radius:5px;
padding: 5px 5px 5px 5px;
}

</style>
<body>

  <div class="content">
    <section class="main-header grid">
      <h1>Approved Investors</h1>
     
    </section>

   

    <div class="card">
      <table>
        <thead>
          <tr>
            <th>
              <div class="test"></div>
              
            </th>
            <th>Investor-ID</th>
            <th>Investor-name</th>
            <th>Investor-email</th>
            <th>Investor-mob</th>
            <th>Investor-PAN</th>
            <th>Location</th>
            <th>Password</th>
            <th>Interest</th>
            <th>Funding</th>
            <th>Status</th>
            <th>Delete</th>
            
          </tr>
        </thead>
 <%
 String Approved="Approved";
 try 
	{
		Connection con=connectDB.connect();	
		
      
		PreparedStatement ps1=con.prepareStatement("select * from investor where statuse=?");
		ps1.setString(1,Approved);
		ResultSet r1=ps1.executeQuery();
		while(r1.next())
		{
 %>
        <tbody>
          <tr class="selected">
            <td>
              
            </td>
            <td><%=r1.getString(1)%></td>
            <td><%=r1.getString(2)%></td>
            <td><%=r1.getString(3)%></td>
            <td><%=r1.getString(4)%></td>
            <td><%=r1.getString(5)%></td>
            <td><%=r1.getString(6)%></td>
            <td><%=r1.getString(7)%></td>
            <td><%=r1.getString(8)%></td>
            <td><%=r1.getString(9)%></td>
            <td><%=r1.getString(10)%></td>
            
            <td><a href="delete2.jsp?del2=<%=r1.getString(1)%>"><button>Delete</button></a></td>
           </tr>
           <%
		}
	}
	catch(Exception e)
	{
		System.err.println("Something Wrong..!");
		e.printStackTrace();
	}

           %>
         </tbody>
      </table>
    </div>
         
      
    <section class="table-footer grid">
      
      <div class="paging grid">
        
        <div class="button icon">
        <a href="Adminmenu.html">
          <i class="fa-solid fa-angle-left"></i>
          </a>
        </div>
       
      </div>
    </section>

   
  </div>

  
</body>
</html>