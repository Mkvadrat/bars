        
        <!-- start footer -->
        <footer>
            <div class="block1">
                <div>
                    <?php if ($logo) { ?>
                        <a class="logo-footer" href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
                    <?php } else { ?>
                        <h1><a class="logo-footer" href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                    <?php } ?>

                    <ul>
                        <li><?php echo $telephone; ?></li>
                        <li><a href="email:<?php echo $email; ?>"><?php echo $email; ?></a></li>
                    </ul>
                </div>
            </div>
            <div class="block2">
                <ul>
                    <li>
                        <a href="<?php echo $mans; ?>">Мужская коллекция</a>
                    </li>
                    <li>
                        <a href="<?php echo $womans; ?>">Женская коллекция</a>
                    </li>
                    <li>
                        <a href="<?php echo $special; ?>">Акции</a>
                    </li>
                </ul>
            </div>
            <div class="block3">
                <ul>
                 <?php foreach ($informations as $information) { ?>
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                <?php } ?>
                    <li><a href="<?php echo $contact; ?>">Контакты</a></li>
                </ul>
            </div>
            <div class="block4">
                <div>
                    <p>Принимаем к оплате</p>

                    <ul class="payment-systems">
                        <li></li>
                        <li></li>
                    </ul>

                    <p>Социальные сети</p>

                    <ul class="social-networks">
                        <li>
                            <a href="<?php echo $vk; ?>"></a>
                        </li>
                        <li>
                            <a href="<?php echo $fb; ?>"></a>
                        </li>
                        <li>
                            <a href="<?php echo $insgm; ?>"></a>
                        </li>
                    </ul>

                    <a class="m2" href="">Сайт разработан в</a>
                </div>
            </div>
        </footer>

        <!-- end footer -->
    </div>
</body>
</html>