import "./styles.css";

const states = [
  "Alabama",
  "Alaska",
  "American Samoa",
  "Arizona",
  "Arkansas",
  "California",
  "Colorado",
  "Connecticut",
  "Delaware",
  "District of Columbia",
  "Federated States of Micronesia",
  "Florida",
  "Georgia",
  "Guam",
  "Hawaii",
  "Idaho",
  "Illinois",
  "Indiana",
  "Iowa",
  "Kansas",
  "Kentucky",
  "Louisiana",
  "Maine",
  "Marshall Islands",
  "Maryland",
  "Massachusetts",
  "Michigan",
  "Minnesota",
  "Mississippi",
  "Missouri",
  "Montana",
  "Nebraska",
  "Nevada",
  "New Hampshire",
  "New Jersey",
  "New Mexico",
  "New York",
  "North Carolina",
  "North Dakota",
  "Northern Mariana Islands",
  "Ohio",
  "Oklahoma",
  "Oregon",
  "Palau",
  "Pennsylvania",
  "Puerto Rico",
  "Rhode Island",
  "South Carolina",
  "South Dakota",
  "Tennessee",
  "Texas",
  "Utah",
  "Vermont",
  "Virgin Island",
  "Virginia",
  "Washington",
  "West Virginia",
  "Wisconsin",
  "Wyoming"
];

// Code goes here
const input = document.querySelector("#autocomplete");
let regex;

function addResultsElements(state) {
  // add results to the results element
  var resultElm = document.createElement("DIV"); // Create a <button> element
  resultElm.innerHTML = state; // Insert text
  document.getElementById("results").appendChild(resultElm);
  document.body.appendChild(resultElm);
}
function clearResults() {
  document.getElementById("results").innerHTML = "";
}

function logKey(e) {
  let found;
  console.log(regex);
  let enhancedRegexSeed = "^" + e.target.value;
  regex = new RegExp(enhancedRegexSeed, "i");

  states.forEach((state) => {
    found = state.match(regex);
    if (found !== null) {
      // console.log(state);
      addResultsElements(state);
    }
  });
}
document.addEventListener("keyup", logKey);
