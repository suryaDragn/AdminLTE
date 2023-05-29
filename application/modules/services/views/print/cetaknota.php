<script type="text/javascript">
//   window.print();
</script>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>

  <link rel="stylesheet" href="<?php echo base_url().'assets/bootstrap/css/bootstrap.min.css' ?>">
  <!-- <link rel="stylesheet" href="<?php echo base_url().'assets/paper.css' ?>"> -->
  <style>
    .float {
      /*float: right;*/
      color: #000;
      /*text-align: right;*/
      /*width: 180px;*/
      position: absolute;
      bottom: 20px;
      right: 20px;
    }
    body {
        color:red;
        font-size: 11px;
    }
    

    @page { margin: 0 }
    body { margin: 0 }
    .sheet {
      margin: 0;
      overflow: hidden;
      position: relative;
      box-sizing: border-box;
      page-break-after: always;
    }

    /** Paper sizes **/
    body.A3           .sheet { width: 297mm; height: 419mm }
    body.A3.landscape .sheet { width: 420mm; height: 296mm }
    body.A4           .sheet { width: 210mm; height: 296mm }
    body.A4.landscape .sheet { width: 297mm; height: 209mm }
    body.A5           .sheet { width: 148mm; height: 209mm }
    body.A5.landscape .sheet { width: 210mm; height: 147mm }

    /** Padding area **/
    .sheet.padding-5mm { padding: 5mm }
    .sheet.padding-10mm { padding: 10mm }
    .sheet.padding-15mm { padding: 15mm }
    .sheet.padding-20mm { padding: 20mm }
    .sheet.padding-25mm { padding: 25mm }

    /** For screen preview **/
    @media screen {
      body { background: #e0e0e0 }
      .sheet {
        background: white;
        box-shadow: 0 .5mm 2mm rgba(0,0,0,.3);
        margin: 5mm;
      }
    }

    /** Fix for Chrome issue #273306 **/
    @media print {
               body.A3.landscape { width: 420mm }
      body.A3, body.A4.landscape { width: 297mm }
      body.A4, body.A5.landscape { width: 210mm }
      body.A5                    { width: 148mm }

    }

    @media all {
    .page-break { display: none; }
    }

    @media print {
    .page-break { display: block; page-break-before: always; }
    }

    .col-print-1 {width:8%;  float:left;}
    .col-print-2 {width:16%; float:left;}
    .col-print-3 {width:25%; float:left;}
    .col-print-4 {width:33%; float:left;}
    .col-print-5 {width:42%; float:left;}
    .col-print-6 {width:50%; float:left;}
    .col-print-7 {width:58%; float:left;}
    .col-print-8 {width:66%; float:left;}
    .col-print-9 {width:75%; float:left;}
    .col-print-10{width:83%; float:left;}
    .col-print-11{width:92%; float:left;}
    .col-print-12{width:100%; float:left;}
    table td {
      font-weight: bold;
      
    }

    .tb_primary td {
      text-align: center;
      padding: 1px;
      font-size: 14px;
    }
  </style>

</head>
<body class="A5" >
<section class="sheet padding-5mm">
   <div class="row">
       <div class="col-print-6">
        <span><?= (!empty($ss_settings->icon))?'<img style="width:80px;" src="'.PATH_ASSETS.'img/pic/'. $ss_settings->icon.'" alt="">':"LOGO" ;?></span>  
       </div>
    
       <div class="col-print-6">
          <table>
              <tr>
                <td>Nama</td>
                <td style="padding-left: 15px;">:</td>
                <td style="font-weight: normal;">&nbsp;<?= $nama_member; ?></td>
              </tr>
              <tr>
                <td colspan="3" style="color:red"><hr/></td>
              </tr>
             <tr>
               <td>Tanggal</td>
               <td style="padding-left: 15px;">:</td>
               <td style="font-weight: normal;">&nbsp;<?= $tanggal ?></td>
             </tr>
          
           </table>
       </div>
   </div>
   <div class="row">
    <div class="col-print-12">
        <br/>
    </div>
   </div>
   <div class="row">
        <div class="col-print-6">
            <label>== GAGAKSIPAT NGEMPLAK BOYOLALI ==</label><br/>
            <label><i class="fas fa-fw fa-phone"></i>0856 9240 0481</label> 
        </div>
        <div class="col-print-6">
            <table>
                <tr>
                    <td>NOPOL</td>
                    <td style="padding-left: 15px;">:</td>
                    <td style="text-decoration: underline;">&nbsp;<?= $plat_nomor ?></td>
                </tr>
            </table>
        </div>
   </div>

   <div class="col-print-12" style="margin-top: 10px; margin-bottom: 10px;">
     <table border="1" style="width: 100%" class="tb_primary">
       <tr>
         <td style="width:50px;">NO</td>
         <td style="width:120px;">BANYAKNYA</td>
         <td style="width:130px;">NAMA BARANG</td>
         <td>HARGA</td>
         <td>TOTAL HARGA</td>
       </tr>
       <?php 
       $no = 0;
       $jmlHrg = 0;
            // foreach($detail_barang as $row){
            for($i = 0 ;$i<20;$i++){
                if(!empty($detail_barang[$i])){
                $row = $detail_barang[$i];
       ?>
        <tr>
         <td style="font-weight: normal;color:black"><?= ++$no; ?></td>
         <td style="font-weight: normal;color:black"><?=  $row->jumlah_barang; ?></td>
         <td style="font-weight: normal;color:black"><?=  $row->nama_barang; ?></td>
         <td style="font-weight: normal;color:black"><?=  $row->harga; ?></td>
         <td style="font-weight: normal;color:black"><?=  $row->total_harga; ?></td>
        </tr>
        <?php
        $jmlHrg += $row->total_harga;
                }else{?>
        <tr>
         <td style="font-weight: normal;color:black"><br/></td>
         <td style="font-weight: normal;color:black"><br/></td>
         <td style="font-weight: normal;color:black"><br/></td>
         <td style="font-weight: normal;color:black"><br/></td>
         <td style="font-weight: normal;color:black"><br/></td>
        </tr>
        <?php   }
            }
        ?>


       <tr>
         <td colspan="4">Total </td>
         <td style="font-weight: normal;color:black"><?= $jmlHrg; ?></td>
       </tr>        
     </table>
   </div>
   <div class="row">
    <div class="col-print-12">
        <br/>
    </div>
   </div>
   <div class="row">
    <div class="col-print-2">
            <br/>
    </div>
    <div class="col-print-5">
        <span style="font-weight: bold;">Tanda Terima,</span>
    </div>
    <div class="col-print-5">
        <span style="font-weight: bold;">Harmat Kami,</span>
    </div>
   </div>

   
   </section>
</body>
</html>