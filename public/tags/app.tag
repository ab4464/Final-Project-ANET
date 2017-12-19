<app>
  <div class="row">
    <div class="col-md-12 col-sm-12">
      <nav class="navbar navbar-inverse navbar-fixed-top">
        <!-- Navbar top -->
        <div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand styleBrand" href="#">
              <span class="letterA">
                A</span><span class="letterN">N</span><span class="letterE">E</span><span class="letterT">T</span></a>
          </div>
          <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
              <li>
                <a href="http://www.tc.columbia.edu/" target="_blank">TC PORTAL</a>
              </li>
              <li>
                <a href="https://my.tc.columbia.edu/" target="_blank">MY TC</a>
              </li>
              <li if={!user}>
                <a target="_self" class="btn pull-right" role="button" onclick={logIn}>LOGIN</a>
              </li>
              <li if={user}>
                <a class="btn pull-right" onclick={logOut} role="button">LOGOUT</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- end Navbar top -->
    </div>
  </div>

  <home-page if={!user}></home-page>
  <!--If there's NO user show home-page tag-->
  <dashboard if={user}></dashboard>

  <script>
    var that = this;
    that.user = firebase.auth().currentUser;
    console.log(this.user);

    firebase.auth().onAuthStateChanged(function (userObj) {
      that.user = firebase.auth().currentUser;
      if (userObj) {
        var database = firebase.database();
        var userProfileRef = database.ref('profile/' + userObj.uid);

        userProfileRef.once('value', function (snapshot) {

          if (snapshot.val() == null) {
            userProfileRef.set("profile-place-holder");
          } else {
            console.log("user exists");
          }
        });
      }
      that.update();

    });

    logIn(e) {
      var provider = new firebase.auth.GoogleAuthProvider();
      firebase.auth().signInWithPopup(provider);
    }

    logOut(e) {
      firebase.auth().signOut();
    }
  </script>
</app>
