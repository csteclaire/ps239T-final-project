# Qualtrics Code Pastebin/Comments

I thought it might be prudent to paste the JavaScript and HTML code that I used to make my survey work for me, along with any tips to help people out.
A valuable resource I used was Kyle Dropp and his website (http://kyledropp.weebly.com/conjoint.html), although I made mine much more barebones and thus might be more helpful to a wider population.

### Without further ado:

<div>Please read the descriptions of the two potential welfare applicants carefully. Then, please indicate which of the two applicants you would <b>personally</b> prefer to see admitted to a welfare program.</div><span><div><span><br></span></div>Scenario 1 out of 5 </span> <font size="1"> </font>
<table border="4" cellpadding="15" cellspacing="0" width="90%">
 <colgroup>
  <col width="140">
  <col width="30">
  <col width="30">
 </colgroup>
 <tbody>
  <tr>
   <th><br></th>
   <th><font size="3"><b>Applicant 1</b></font></th>
   <th><font size="3"><b>Applicant 2</b></font></th>
  </tr>
  <tr>
   <td id="att1"><br></td>
   <td id="a1"><br></td>
   <td id="b1"><br></td>
  </tr>
  <tr>
   <td id="att2"><br></td>
   <td id="a2"><br></td>
   <td id="b2"><br></td>
  </tr>
  <tr>
   <td id="att3"><br></td>
   <td id="a3"><br></td>
   <td id="b3"><br></td>
  </tr>
  <tr>
   <td id="att4"><br></td>
   <td id="a4"><br></td>
   <td id="b4"><br></td>
  </tr>
  <tr>
   <td id="att5"><br></td>
   <td id="a5"><br></td>
   <td id="b5"><br></td>
  </tr>
  <tr>
   <td id="att6"><br></td>
   <td id="a6"><br></td>
   <td id="b6"><br></td>
  </tr>
 </tbody>
</table><br><div><br></div>

<script>
var attRaw = ["Age", "Gender",
"Race", "Education Level", "Employment Status", "Household Information"];

var att = ["Age", "Gender",
"Race", "Education Level", "Employment Status", "Household Information"];

var attributes = ["","","","","",""];

for (i=0; i<attRaw.length;i++ )
{
var rand1 = Math.floor(Math.random()*((attRaw.length-i)-0));
attributes[i] = att[rand1];
att.splice(rand1,1);
}

// Create variables for the potential outcomes of each dimension
var age_raw = ["18-19","20-29","30-39","40+"];
var gender_raw = ["Male","Female"];
var race_raw = ["White","Black/African American","Hispanic/Latino/Spanish Origin"];
var education_raw = ["High school graduate","Some college","College graduate","Graduate or professional degree"];
var employment_raw = ["Unemployed - not seeking employment","Unemployed - seeking employment","Employed"];
var household_raw = ["Lives alone","Married - no children", "Married - has children", "Not married - has children"];



//Use math.random to randomly select attributes for each dimension.

var age_a = age_raw[Math.floor(Math.random()*age_raw.length)];
var gender_a = gender_raw[Math.floor(Math.random()*gender_raw.length)];
var race_a = race_raw[Math.floor(Math.random()*race_raw.length)];
var education_a = education_raw[Math.floor(Math.random()*education_raw.length)];
var employment_a = employment_raw[Math.floor(Math.random()*employment_raw.length)];
var household_a = household_raw[Math.floor(Math.random()*household_raw.length)];

var age_b = age_raw[Math.floor(Math.random()*age_raw.length)];
var gender_b = gender_raw[Math.floor(Math.random()*gender_raw.length)];
var race_b = race_raw[Math.floor(Math.random()*race_raw.length)];
var education_b = education_raw[Math.floor(Math.random()*education_raw.length)];
var employment_b = employment_raw[Math.floor(Math.random()*employment_raw.length)];
var household_b = household_raw[Math.floor(Math.random()*household_raw.length)];


// Create array for first candidate's attributes
// Create array for second candidate's attributes
var att_a_traits = [1,2,3,4,5,6];
var att_b_traits = [1,2,3,4,5,6];

// Take indexOf the Dimension variable. This is the order of the Dimension variable
var age_index = attributes.indexOf("Age");
var gender_index = attributes.indexOf("Gender");
var race_index = attributes.indexOf("Race");
var education_index = attributes.indexOf("Education Level");
var employment_index = attributes.indexOf("Employment Status");
var household_index = attributes.indexOf("Household Information");

// Use IndexOf Dimension and replace with appropriate trait for Candidate A

att_a_traits[age_index] = age_a;
att_a_traits[gender_index] = gender_a;
att_a_traits[race_index] = race_a;
att_a_traits[education_index] = education_a;
att_a_traits[employment_index] = employment_a;
att_a_traits[household_index] = household_a;

// Do the same for the second candidate
att_b_traits[age_index] = age_b;
att_b_traits[gender_index] = gender_b;
att_b_traits[race_index] = race_b;
att_b_traits[education_index] = education_b;
att_b_traits[employment_index] = employment_b;
att_b_traits[household_index] = household_b;


// Create list of variables in the for loop
att_list = ["att1","att2","att3","att4","att5","att6"];
a_list = ["a1","a2","a3","a4","a5","a6"]; 
b_list = ["b1","b2","b3","b4","b5","b6"]; 

// For elements 1 to 8 in the Dimensions, First Candidate and Second Candidate variables. 
// The first line assigns Dimensions to each "id" tag in the first column of the HTML table
// The second line assigns first candidate traits to each "id" tag in the second 
//column of the HTML table
// The third line assigns second candidate traits to each "id" tag in the third 
//column of the HTML table
for(i=0;i<6;i++){
    document.getElementById(att_list[i]).innerHTML= attributes[i];
    document.getElementById(a_list[i]).innerHTML= att_a_traits[i];    
    document.getElementById(b_list[i]).innerHTML= att_b_traits[i];    }

</script>

### Explanation
My commentary (along with Kyle Dropp's, which is most of the comments in the code) is fairly explanatory. The important thing, if you're trying to do this yourself, is that this was entirely done in the HTML section of Qualtrics, NOT in the "add JavaScript" section. The reason for this is because you are defining variables in the environment that the later JavaScript needs to pull from. Using the explicit JavaScript code entry in Qualtrics doesn't allow a future question to access these defined variables. I'm not sure if this is a bug or not. Nonetheless, the start of the JavaScript is "<script>". Before that point is the HTML part of the project, which defines a table and placeholder variables that will be filled with randomized outcomes by the JavaScript code.

### The follow-up code:
Qualtrics.SurveyEngine.addOnload(function()
{
/*Place Your Javascript Below This Line*/
  this.setChoiceValue(1,age_a); 
  this.setChoiceValue(2,gender_a); 
  this.setChoiceValue(3,race_a); 
  this.setChoiceValue(4,education_a); 
  this.setChoiceValue(5,employment_a); 
  this.setChoiceValue(6,household_a); 
  this.setChoiceValue(7,age_b); 
  this.setChoiceValue(8,gender_b);
  this.setChoiceValue(9,race_b); 
  this.setChoiceValue(10,education_b); 
  this.setChoiceValue(11,employment_b); 
  this.setChoiceValue(12,household_b); 
  this.setChoiceValue(13,attributes); 

});

### Explanation
This next step is the most important part of the conjoint, since it saves the randomized values. If this part if not included in the Qualtrics survey, you have literally zero information about the "treatment" or condition that each respondent got. Everything would be arbitrary and would hold no educational value without it!

This JavaScript code is a part of an entry-form question on Qualtrics that used HTML to hide the question from the respondent. The function "setChoiceValue" automatically fills the fields with whatever you want; in this case, it was filled with the randomized outcomes from my HTML table. This code pulls from the same variables as the first question, which is why the first question was entirely formatted in the HTML environment.
