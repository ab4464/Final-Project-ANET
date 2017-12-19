<home>
  <div class="row">
    <div class="col-sm-12 col-md-12 col-xs-12">
      <div class="row">
        <div class="col-sm-10 col-md-10 col-xs-10">
          <!-- USER INFO SECTION-->
          <div class="row row-style">
            <!--USER IMAGE ROW-->
            <div class="col-sm-12 col-md-12 col-xs-12">
              <img src="img/1920x1080/01.jpg" height="450px" width="101.5%" class="bg img-fluid"/>
              <div class="form-group">
                <img src="http://placehold.it/210x210" class="userImg img-fluid img-circle" height="35%" width="20%" id="userId"/>
                <input type="file" onchange={uploadImg} id="inputFile" class="load-img-position"/>
              </div>
            </div>
            <div class="row">
              <!-- USER ABOUT ROW -->
              <div class="col-sm-12 col-md-12 col-xs-12">
                <div class="row height">
                  <div class="col-sm-12 col-md-12 col-xs-12">
                    <h4 class="greeting">Hi {user.displayName}!</h4>
                    <h5 class="info-title">MY PROFILE</h5>
                    <button class="btn1-position btn btn-sm btn-primary" onclick={editAbout} if={!userEditAbout}>EDIT</button>
                    <button class="btn1-position btn btn-sm btn-primary" onclick={closeAbout} if={userEditAbout}>CLOSE</button>
                    <div class="row">
                      <div class="col-sm-6 col-md-6 col-xs-6">
                        <h5 class="subtitle" if={!userEditAbout}>My Department:
                          <span class="print-info">{userProfile.department}</span></h5>
                        <div class="form-group" if={userEditAbout}>
                          <label class="subtitle">My Department:
                          </label>
                          <select ref="department" value="" class="select-position">
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
                        <h5 class="subtitle" if={!userEditAbout}>My Project:
                          <span class="print-info">{userProfile.project}</span></h5>
                        <div class="form-group" if={userEditAbout}>
                          <label class="subtitle">My Project:
                          </label>
                          <select value="" ref="current_projects" class="select-position">
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
                      <div class="col-sm-5 col-md-5 col-xs-5">
                        <h5 class="subtitle" if={!userEditAbout}>My Skills:
                          <span class="print-info">{userProfile.skills}</span></h5>
                        <div class="form-group" if={userEditAbout}>

                          <label class="subtitle">Skills:
                          </label>
                          <input ref="skills" class="select-position"/><br/>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-4 col-md-4 col-xs-4 col-sm-offset-4 col-md-offset-4 col-xs-offset-4">
                        <button if={userEditAbout} class="btn2-position btn btn-sm btn-block btn-primary" onclick={saveInfo}>SAVE</button>
                      </div>
                    </div>

                    <div></div>

                  </div>

                </div>

              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-2 col-md-2 col-xs-2">
          <!-- CHAT SECTION -->
          <h4 class="title">
            <i class="fa fa-ravelry" aria-hidden="true"></i>
            YOUR TEAM</h4>
          <hr/>
          <img src="img/400x400/02.jpg" width="18%">
          <span>
            Angela Harries</span>
          <br/>
          <br/>
          <img src="img/400x400/04.jpg" width="18%">
          <span>
            Eva Moore</span>
          <br/>
          <br/>
          <img src="img/400x400/01.jpg" width="18%">
          <span>
            Tom Adams</span>
          <br/>
          <br/>

          <h4 class="title">
            <i class="fa fa-ravelry" aria-hidden="true"></i>
            YOUR FRIENDS</h4>
          <hr/>
          <img src="img/400x400/05.jpg" width="18%">
          <span>
            Tucker Williams</span>
          <br/>
          <br/>
          <img src="img/400x400/06.jpg" width="18%">
          <span>
            Indiana Estevez</span>
          <br/>
          <br/>
          <img src="img/400x400/02.jpg" width="18%">
          <span>
            Angela Harries</span>
          <br/>
          <br/>
          <br/>
          <br/>
          <div class="row">
            <div class="col-sm-6 col-md-6 col-xs-6">
              <button class="btn btn-light btn-sm" type="button">LOAD MORE</button>
            </div>
            <div class="col-sm-6 col-md-6 col-xs-6">
              <button class="btn btn-warning btn-sm">MESSAGE</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    var that = this;
    this.page = "home";
    that.userImg = "http://placehold.it/210x210";
    this.userEditSkills = false;
    this.userEditAbout = false;
    this.user = firebase.auth().currentUser || "Anonymous";
    this.userProfile = {};

    //WRITING TO DATABASE
    var database = firebase.database();
    var userProfileRef = database.ref('profile/' + this.user.uid);

    userProfileRef.once('value', function (snapshot) {
      that.userProfile = snapshot.val();
      that.update();
    });

    saveInfo(event) {
      if ((event.type === "keypress" && event.which === 13) || event.type === "click") {
        var key = userProfileRef.push().key;
        var profile = {
          id: key,
          userID: this.user.uid, //Global Google Auth user object
          author: this.user.displayName,
          department: this.refs.department.value,
          skills: this.refs.skills.value.split(","),
          project: this.refs.current_projects.value,
          createdAt: firebase.database.ServerValue.TIMESTAMP,
          modifiedAt: firebase.database.ServerValue.TIMESTAMP
        };

        userProfileRef.set(profile);
        userProfileRef.once('value', function (snapshot) {
          this.userProfile = snapshot.val();
          console.log(userProfile);

        });
        this.closeAbout();
        that.update();
      }

    }

    //UPLOADING USER IMG-FILE PROFILE
    that.uploadImg = function (e) {
      var preview = document.getElementById('userId');
      var file = document.querySelector('input[type=file]').files[0];
      var reader = new FileReader();
      reader.addEventListener("load", function () {
        preview.src = reader.result;
      }, false);
      if (file) {
        reader.readAsDataURL(file); //I need to save this into the data base???
      }
    }
    editAbout(e) {
      that.userEditAbout = true;
    }
    closeAbout(e) {
      that.userEditAbout = false;
      that.update();
    }
    editSkills(e) {
      that.userEditSkills = true;
    }
    closeSkills(e) {
      that.userEditSkills = false;
    }
  </script>

  <style>
    .bg {
      position: relative;
      z-index: 1;
    }

    .row-style {
      margin-right: 0;
      padding-right: 0;
      background-color: #eee;
      height: auto;
      overflow: hidden;
    }

    .userImg {
      position: absolute;
      z-index: 3;
      top: 150px;
      left: 433px;
      border: 3px solid #ccc;
    }

    .load-img-position {
      position: absolute;
      z-index: 3;
      top: 360px;
      left: 496px;
      border-radius: 110px;
    }

    .title {
      padding-top: 70px;
      color: #218ece;
      line-height: 15px;
      width: 100%;
      overflow: hidden;
    }

    .height {
      height: 280px;
    }

    .greeting {
      color: #218ece;
      margin-left: 25px;
      text-align: center;
    }

    .subtitle {
      margin-left: 40px;
      color: #218ece;
      padding-bottom: 20px;
    }

    .select-position {
      position: relative;
      z-index: 3;
    }

    .info-title {
      color: #616172;
      margin-left: 25px;
      padding-bottom: 5px;
    }

    .input1-style {
      margin-left: 25px;
      position: relative;
      z-index: 3;
      width: 60%;
      height: 60px;
    }

    .btn1-position {
      position: relative;
      float: right;
      right: 15px;
      top: -35px;
      z-index: 3;
    }
    .btn2-position {
      position: relative;
      float: right;
      right: 45px;
      z-index: 3;
    }

    .print-info {
      color: #616172;
      padding-left: 14px;
    }
  </style>

</home>
