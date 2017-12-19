<search-users>
  <div class="box">
    <div class="row">
      <div class="col-sm-4 col-md-4">
        <img src="img/450x700/bulb-colors.jpg" class="img-fluid" height="420px"/>
      </div>
      <div class="col-sm-8 col-md-8">
        <div class="row">
          <div class="col-sm-12 col-md-12">
            <h3 class="title">Welcome to
              <span class="letterA">
                A</span><span class="letterN">N</span><span class="letterE">E</span><span class="letterT">T</span>
              Database</h3>
            <hr/>
            <h5 class="lead hero">Looking For Schoolmates To Partner With?</h5>
          </div>
        </div>
        <div class="row y-spacing">
          <div class="col-sm-12 col-md-12">
            <div class="form-group">
              <label for="department">By Department</label>
              <select ref="department" value="" onchange={getByDepartment}>
                <option value="" selected="selected">Select the Department</option>
                <option value="Arts and Humanities">Arts &amp; Humanities
                </option>
                <option value="Behavioral Science">Biobehavioral Science</option>
                <option value="Counseling and Clinical Psychology">Counseling &amp; Clinical Psychology</option>
                <option value="Curriculum and Teaching">Curriculum &amp; Teaching</option>
                <option value="Education Policy and Social Analysis">Education Policy &amp; Social Analysis</option>
                <option value="health_behavior">Health &amp; Behavior Studies</option>
                <option value="Human Development">Human Development</option>
                <option value="International and Transcultural Studies">International &amp; Transcultural Studies</option>
                <option value="MSTU">Mathematics, Science &amp; Technology</option>
                <option value="Organization and Leadership">Organization &amp; Leadership</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row y-spacing">
          <div class="col-sm-12 col-md-12">
            <div class="form-group">
              <label for="current_projects">By Project</label>
              <select value="" ref="current_projects" onchange={getByProjects}>
                <option value="" selected="selected">Select by Projects</option>
                <option value="EdTech for kids">EdTech for kids</option>
                <option value="Development of Leadership Training Program">Development of Leadership Training Program</option>
                <option value="Mental Health Education in Communities">Mental Health Education in Communities</option>
                <option value="Research in Dementia">Research in Dementia</option>
                <option value="Social Media APP to denounce human rigths violations">Social Media APP to denounce human rigths violations</option>
                <option value="Data for change in K-12">Data for change in K-12</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row y-spacing">
          <div class="col-sm-12 col-md-12">
            <div class="form-group">
              <label for="skills">By Skillset</label>
              <input onkeypress={getBySkill} ref="skills" size="40" placeholder=" e.g.: research, SPSS."/>
            </div>
          </div>
        </div>
        <div class="row y-spacing">
          <div class="col-sm-5 col-md-5 col-sm-offset-4 col-md-offset-4">
            <button type="submit" class="btn btn-block btn-info" onclick={getBySkill}>Search</button>
          </div>
        </div>
      </div>
    </div>
    <pre class="box-height" if={pre}>
      <h5><strong>ANET users that match selected criteria:</strong> {user.length} out of {total}</h5>
        <p each={user}><strong>{name} </strong>/ <i>{department}</i> / {skills}</p> <br />
    </pre>
  </div>

   <script>
    //variable setting
     var that = this;
     that.user = [];
     this.pre = false;


     //firebase --> reading from database
     var database = firebase.database();
     var lookForUsers = database.ref('search-users');

     //search database
     lookForUsers.once('value', function(snap){
       var data = snap.val();
       that.total = Object.keys(data).length; //total of users in database
       console.log(that.total);
       var userQuery = [];
       for (var key in data) {
         userQuery.push(data[key]);
       }
       that.user = userQuery;
       console.log(that.user[name]);
       that.update();
     });


     getByDepartment(e){
       that.user = "";
       that.pre = true;
       var selectedDepartment = this.refs.department.value;
       var query = lookForUsers.orderByChild('department');
       if(selectedDepartment){
       query = query.equalTo(selectedDepartment);
     }
      query.once('value', function(snap){
        var data = snap.val();
        console.log(data);
        var userQuery = [];
        for (var key in data) {
          userQuery.push(data[key]);
        }
        that.user = userQuery;
        that.update();
        that.off();
     });

    }

     getByProjects(e){
       that.user = "";
       that.pre = true;
       var selectedProject = this.refs.current_projects.value;
       var query = lookForUsers.orderByChild('current_projects');
       if(selectedProject){
         query = query.equalTo(selectedProject);
       }
       query.once('value', function(snap){
         var data = snap.val();
         var userQuery = [];
         for (var key in data) {
           userQuery.push(data[key]);
         }
         that.user = userQuery;
         that.update();
         that.off();
      });
     }

    getBySkill(e){
      that.pre = true;
      if (event.which === 13){
        console.log(event);
        var selectedSkills = this.refs.skills.value;
        var query = lookForUsers;
        console.log(query);


        query.once('value', function(snap){
          var data = snap.val();
          var userQuery = [];
          for (var key in data) {
            for (var counter in data[key]['skills']){
              if(selectedSkills.toLowerCase() == data[key]['skills'][counter].toLowerCase()){
                userQuery.push(data[key]);
              }
            }
          }
          console.log(userQuery);
          that.user = userQuery;
          that.update();
        });
        }
    }
   </script>



    <style>
    .position{
      position: relative;
      z-index: -1;
      top: 52px;
      overflow-y: hidden;

    }
    .box{
      position: fixed;
      top: 65px;
      z-index: 4;
      border: 1px solid #56d6ea;
      height: auto;
      width: 90%;
      padding: 0 25px;
      text-align: center;
      margin: 0;
      border-radius: 20px;
      margin-bottom: 15px;

    }
    .title{
      padding-left: 5px;
      color: #43b9cd;
      text-transform: uppercase;
      size: 15px;
      text-align: center;
      letter-spacing: -1px;
      letter-spacing: 3px;
      text-shadow: 1px 2px white;
    }
    .hero {
      text-align: center;
      letter-spacing: 3px;
      line-height: normal;
      padding-left: 20px;
      color: #5d6166;
      text-shadow: 1px 2px #eee;
      padding-bottom: 25px;
    }

    .y-spacing{
      line-height: 25px;
      font-size: 16px;
      color: #5d6166;
      padding-bottom: 15px;
    }

    .box-height{
      height: auto;
    }

    </style>



</search-users>
