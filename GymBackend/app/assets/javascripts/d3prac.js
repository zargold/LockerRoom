$( document ).ready(function(){
  var margin = {top: 20, right: 20, bottom: 30, left: 50},
        width = 960 - margin.left - margin.right,
        height = 500 - margin.top - margin.bottom;

    var parseDate = d3.time.format("%d-%b-%y").parse;

    var x = d3.time.scale()
        .range([0, width]);

    var y = d3.scale.linear()
        .range([height, 0]);

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom");

    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left");
    var valueline = d3.svg.line()
      .x(function(d) {return x(d.Date) })
      .y(function(d) {return y(d.Weight); });

    var repsline = d3.svg.line()
      .x(function(d){return x(d.Date); })
      .y(function(d){return y(d.Reps); });

    var svg = d3.select("#d3-Chart").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
      .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
  function callBackD3(workoutData){ 
    d3.json(workoutData, function (error, data) { 
      if(error) console.log(error);
      console.log(workoutData);
      console.log(data)
      data.forEach(function(d) {
        console.log(d);
        d.Date = d.id;
        d.Weight = +d.weight;
        d.Reps = +d.reps*2;
      });

    x.domain(d3.extent(data, function(d) { return d.Date; }));
    y.domain([0, d3.max(data, function(d) { return d.Weight; })]);

    svg.append("path")
      .attr("class", "line")
      .attr("d", valueline(data));

    svg.append("path")
      .attr("class", "repsline")
      .attr("d", repsline(data));
//THIS DRAWS THE ACTUAL AXIS of THE CHART!
    svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
      .append("text")
        .style("text-anchor", "start")
        .text("Workout Time Entry");

    svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Weight (Pounds)/Reps");



    });
 }
callBackD3("workouts.json");
 });

