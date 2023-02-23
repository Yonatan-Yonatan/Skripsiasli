
if(isset($_POST['updatebarangkeluar'])){
        $idk = $_POST['idkeluar']; //iddata
        $idbarang= $_POST['idbarang']; //idbarang
        $qty = $_POST['qty'];
        $keterangan = $_POST['penerima'];

        $lihatstock = mysqli_query($conn,"select * from stock where idbarang='$idbarang'"); //lihat stock barang itu saat ini
        $stocknya = mysqli_fetch_array($lihatstock); //ambil datanya
        $stockskrg = $stocknya['stock'];//jumlah stocknya skrg

        $lihatdataskrg = mysqli_query($conn,"select * from keluar where idkeluar='$idk'"); //lihat qty saat ini
        $preqtyskrg = mysqli_fetch_array($lihatdataskrg); 
        $qtyskrg = $preqtyskrg['qty'];//jumlah skrg

        if($qty >= $qtyskrg){
            //ternyata inputan baru lebih besar jumlah keluarnya, maka kurangi lagi stock barang
            $hitungselisih = $qty-$qtyskrg;
            $kurangistock = $stockskrg-$hitungselisih;

            $queryx = mysqli_query($conn,"update stock set stock='$kurangistock' where idbarang='$idbarang'");
            $updatedata1 = mysqli_query($conn,"update keluar set qty='$qty',penerima='$keterangan' where idkeluar='$idk'");
            
            //cek apakah berhasil
            if ($updatedata1 && $queryx){

                echo " <div class='alert alert-success'>
                    <strong>Success!</strong> Redirecting you back in 1 seconds.
                </div>
                <meta http-equiv='refresh' content='1; url= TEST.php'/>  ";
                } else { echo "<div class='alert alert-warning'>
                    <strong>Failed!</strong> Redirecting you back in 3 seconds.
                </div>
                <meta http-equiv='refresh' content='3; url= indexx.php'/> ";
                };

        } else {
            //ternyata inputan baru lebih kecil jumlah keluarnya, maka tambahi lagi stock barang
            $hitungselisih = $qtyskrg-$qty;
            $tambahistock = $stockskrg+$hitungselisih;

            $query1 = mysqli_query($conn,"update stock set stock='$tambahistock' where idbarang='$idbarang'");

            $updatedata = mysqli_query($conn,"update keluar set  qty='$qty', penerima='$keterangan' where idkeluar='$idk'");
            
            //cek apakah berhasil
            if ($query1 && $updatedata){

                echo " <div class='alert alert-success'>
                    <strong>Success!</strong> Redirecting you back in 1 seconds.
                </div>
                <meta http-equiv='refresh' content='1; url= TEST.php'/>  ";
                } else { echo "<div class='alert alert-warning'>
                    <strong>Failed!</strong> Redirecting you back in 3 seconds.
                </div>
                <meta http-equiv='refresh' content='3; url= indexx.php'/> ";
                };

        };        
    };

    if(isset($_POST['hapusbarangkeluar'])){
        $idk = $_POST['idkeluar'];
        $idbarang = $_POST['idbarang'];

        $lihatstock = mysqli_query($conn,"select * from stock where idbarang='$idbarang'"); //lihat stock barang itu saat ini
        $stocknya = mysqli_fetch_array($lihatstock); //ambil datanya
        $stockskrg = $stocknya['stock'];//jumlah stocknya skrg

        $lihatdataskrg = mysqli_query($conn,"select * from keluar where idkeluar='$idk'"); //lihat qty saat ini
        $preqtyskrg = mysqli_fetch_array($lihatdataskrg); 
        $qtyskrg = $preqtyskrg['qty'];//jumlah skrg

        $adjuststock = $stockskrg+$qtyskrg;

        $queryx = mysqli_query($conn,"update stock set stock='$adjuststock' where idbarang='$idbarang'");
        $del = mysqli_query($conn,"delete from keluar where idkeluar='$idk'");

        
        //cek apakah berhasil
        if ($queryx && $del){

            echo " <div class='alert alert-success'>
                <strong>Success!</strong> Redirecting you back in 1 seconds.
              </div>
            <meta http-equiv='refresh' content='1; url= TEST.php'/>  ";
            } else { echo "<div class='alert alert-warning'>
                <strong>Failed!</strong> Redirecting you back in 1 seconds.
              </div>
             <meta http-equiv='refresh' content='1; url= indexx.php'/> ";
            }
    };
	?>