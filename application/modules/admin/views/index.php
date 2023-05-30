<div class="content-header">
  <div class="container-fluid">
    <?= $this->session->flashdata('pesan') ?>
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0 text-dark">Dashboard</h1>
      </div>
    </div>
  </div>
</div>
<section class="content">
  <div class="container-fluid">
    <div class="row">
        <div class="card" style="width:100%">
          <div class="card-body">
            <div class="d-flex">
              <p class="d-flex flex-column" style="color:red">
              <?= (!empty($ss_settings->icon))?'<img style="width:100%;" src="'.PATH_ASSETS.'img/pic/'. $ss_settings->icon.'" alt="">':'<span class="text-bold text-lg">BANARAN AUTO SERVICE</span>
                <span>= GAGAKSIPAT NGEMPLAK BOYOLALI =</span>
                <span><i class="fas fa-fw fa-phone"></i>0856 9240 0481</span>' ;?>
                
              </p>
            </div>
          </div>
        </div>
    </div>
  </div>
</section>