<?php require_once 'header.php';  require_once 'mainnav.php';?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $lang['PAGETITLE']; ?></title>
</head>

<body>
    <div style="border:1px solid black;padding: 2px;height: 750px;margin-top: -1px;width: 1820px;margin-left: 70px;">
        <br>
        <form name="f1" action="" method="post">
            <table class="active" cellpadding="2" cellspacing="0" border="3" style="margin-left:35px; width: 50%;">
                <tr align="center" style="background-color: lightsteelblue; padding: 7px;">
                    <th class="lbl"><?php echo $lang['P1']; ?></th>
                    <th class="lbl"><?php echo $lang['P2']; ?></th>
                    <th class="lbl"><?php echo $lang['P3']; ?></th>
                    <th class="lbl"><?php echo $lang['P4']; ?></th>
                    <th class="lbl"><?php echo $lang['P5']; ?></th>
                    <th class="lbl"><?php echo $lang['P6']; ?></th>
                    <th class="lbl"><?php echo $lang['P7']; ?></th>
                </tr>
                <?php 
                require_once 'DBConnection.php'; 
                $kvmdata=new DB_con();           