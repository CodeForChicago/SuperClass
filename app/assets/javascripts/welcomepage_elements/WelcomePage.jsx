var  WelcomePage = React.createClass({


  render: function () {

  return ( <div className = "container"> // size 100
            <div className = "row"> // size 60%
              <div className = "col-md-9">
                <div className = "row firstRow_for_css">  //.firstRow_for_css {
                                                          // background: blue;
                                                          //  }
                  <FirstRow />
                <PsuedoRow />
                </div>
                <div className = "row secondRow_for_css">
                  <SecondRow />
                </div>
                <div className = "row thirdRow_for_css">
                 <ThirdRow />
                </div>
               </div>
              <div className = "col-md-3">
               <div className = "row">
                <Fixed />
               </div>
              </div>
            </div>
          </div>)

}});

var FirstRow = React.createClass({
  render: function() {


  return ()


}});

var SecondRow = React.createClass({
  render: function() {


  return ()


}});


var ThirdRow = React.createClass({
  render: function() {

  return ( <div className = "col-md-12 col-lg-12">
             <div className = "row">
             </div>
             <div className = "row">
                  <div className ="col-md-6 col-lg-6">
                 </div>
                 <div className ="col-md-6 col-lg-6">
                 </div>
             </div>
           </div> )

}});

var Fixed = React.createClass({
  render: function () {

    return ()


}});

module.exports = WelcomePage

