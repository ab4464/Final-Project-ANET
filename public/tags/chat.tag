<chat>
  <div class="row position">
    <div class="col-sm-12 col-md 12 col-xs-12">
      <div class="row">
        <div class="col-sm-4 col-md-4 col-xs-4"> <!-- CHAT MENU -->
            <form class="navbar-form" role="search">
                <div class="form-group navbar-left">
                    <input type="text" class="form-control" placeholder="Search on ANET..." size="21">
                </div>
                <button type="submit" class="btn btn-md btn-warning">Go!</button>
                <br /><br />
            </form>
          <div class="row">
            <div class="col-sm-12 col-md 12 col-xs-12">
              <div class="chat-menu">
              <a href="#"><img src="img/400x400/02.jpg" width="15%"> <span> Angela Harries</span></a><br /><br />
              <a href="#"><img src="img/400x400/04.jpg" width="15%"> <span> Eva Moore</span></a><br /> <br />
              <a href="#"><img src="img/400x400/01.jpg" width="15%"> <span> Tom Adams</span></a><br /> <br />
              <a href="#"><img src="img/400x400/05.jpg" width="15%"> <span> Tucker Williams</span></a><br /> <br />
              <a href="#"><img src="img/400x400/06.jpg" width="15%"> <span> Indiana Estevez</span></a> <br /> <br />
              <a href="#"><img src="img/400x400/03.jpg" width="15%"> <span> Edward Jones</span></a> <br /> <br />
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-8 col-md-8 col-xs-8">
        <div class="row chat-room">
          <div class="col-sm-12 col-md 12 col-xs-12"></div>
        </div>
        <div class="row input-section">
          <div class="col-sm-12 col-md-12 col-xs-12">
            <input type="text" class="input-style" ref="smsChat"/>
              <button class="send-btn btn btn-warning" role="send">SEND</button>
            </div>

          </div>
        </div>
        </div>
    </div>
  </div>



<style>
.position{
  position: relative;
  top:55px;
  margin-left: 0px;
  overflow-x: hidden;
  overflow-y: hidden;
  padding-bottom: 0;
  margin-bottom: 0;
  background-color: ;
  height: 732px;
}

.chat-menu{
  position: relative;
  z-index: 3;
  padding-left: 30px;
}

a{
  text-decoration: none;
  width: 50px;
  height: 100px;
}
a:hover {
  background-color: #eee;
  text-decoration: none;
  font-size: 15px;
}

.chat-room{
height: 620px;
border-left: 6px solid #218ece;
border-bottom: 4px solid #218ece;
}
.input-section{
  border-left: 6px solid #218ece;
  position: absolute;
  z-index: 3;
  width: 100%;
  background-color: #218ece;
  height: 56px;
  padding-bottom: 0;
  margin-bottom: 0;

}
.input-style {
  width: 90%;
  height: 35px;
  padding-left: -50px;
  margin-left: -5px;
  margin-top: 10px;
  font-size: 18px;
  border: none;
}
.send-btn{
height: 35px;
width: 70px;
position: relative;
top: -3px;
}

</style>



</chat>
