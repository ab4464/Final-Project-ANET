<dashboard>
  <navbar-left></navbar-left>
  <div class="row">
    <div class="col-sm-11 col-md-11 col-xs-11 fixed-width">
      <home if={page==="home"}></home>
      <portfolio if={page==="portfolio"}></portfolio>
      <search-users if={page==="search-users"}></search-users>
      <chat if={page==="chat"}></chat>
    </div>
  </div>

<style>
  .fixed-width{
    margin-left: 90px;
  }
</style>

<script>
  var that = this;
  this.page = "home";
  that.userImg = "http://placehold.it/210x210";

  //For Uploading the File
  that.uploadImg = function(e){
    var preview = document.getElementById('userId');
    var file    = document.querySelector('input[type=file]').files[0];
    var reader  = new FileReader();
    reader.addEventListener("load", function(){
      preview.src = reader.result;
      }, false);
      if (file) {
        reader.readAsDataURL(file);  //I need to save this into the data base
    }
  }

  //Mounting the tags
  route(function(urlFragmentA, urlFragmentB, urlFragmentC){
    that.page = urlFragmentA;
    console
      that.update();
    });
    route.start(true);
</script>

</dashboard>
