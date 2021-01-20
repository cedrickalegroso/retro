fx_version 'bodacious'

game 'gta5'

description 'OH RAYT!'

Author 'Cedrick Alegroso'

version '1.0.0'


ui_page 'jsfour-idcard/html/index.html'




server_scripts {
  '@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'config.lua',
  'locales/en.lua',

  'jsfour-idcard/server.lua',

 --'jsfour-licenseplate/server.lua',

  'esx_outlawalert/server/main.lua',

  'sv_stress.lua',


  --'JAM_Pillbox/config.lua',
  --'JAM_Pillbox/utils.lua',
--	'JAM_Pillbox/server.lua',

	--'sp_weazelnews/server/main.lua',

	--'esx_barbershop/server/main.lua',

	'gamz-food/server/main.lua',

	--'DiscordWhitelist/server.lua',

	'esx_bike/translations/en.lua',
	'esx_bike/translations/cz.lua',
	'esx_bike/server.lua'



}

client_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'config.lua',

  'jsfour-idcard/client.lua',
  'bleed.lua',

 -- 'jsfour-licenseplate/client.lua',

  'esx_outlawalert/client/main.lua',

--'JAM_Pillbox/config.lua',
--'JAM_Pillbox/utils.lua',
 -- 'JAM_Pillbox/client.lua',

 -- 'sp_weazelnews/client/main.lua',
 --  'sp_weazelnews/client/annonce.lua', 
--  'sp_weazelnews/client/client.lua',

  --'esx_barbershop/client/main.lua',

  'gamz-food/client/main.lua',
  'gamz-food/client/utils.lua',


  'esx_bike/translations/en.lua',
  'esx_bike/translations/cz.lua',
  --'warmenu.lua',
  'esx_bike/client.lua',


  'stress.lua'
 
  
}



files {
	'jsfour-idcard/html/index.html',
	'jsfour-idcard/html/assets/css/style.css',
	'jsfour-idcard/html/assets/js/jquery.js',
	'jsfour-idcard/html/assets/js/init.js',
	'jsfour-idcard/html/assets/fonts/roboto/Roboto-Bold.woff',
	'jsfour-idcard/html/assets/fonts/roboto/Roboto-Bold.woff2',
	'jsfour-idcard/html/assets/fonts/roboto/Roboto-Light.woff',
	'jsfour-idcard/html/assets/fonts/roboto/Roboto-Light.woff2',
	'jsfour-idcard/html/assets/fonts/roboto/Roboto-Medium.woff',
	'jsfour-idcard/html/assets/fonts/roboto/Roboto-Medium.woff2',
	'jsfour-idcard/html/assets/fonts/roboto/Roboto-Regular.woff',
	'jsfour-idcard/html/assets/fonts/roboto/Roboto-Regular.woff2',
	'jsfour-idcard/html/assets/fonts/roboto/Roboto-Thin.woff',
	'jsfour-idcard/html/assets/fonts/roboto/Roboto-Thin.woff2',
	'jsfour-idcard/html/assets/fonts/justsignature/JustSignature.woff',
	'jsfour-idcard/html/assets/css/materialize.min.css',
	'jsfour-idcard/html/assets/js/materialize.js',
	'jsfour-idcard/html/assets/images/idcard.png',
	'jsfour-idcard/html/assets/images/license.png',
	'jsfour-idcard/html/assets/images/firearm.png',
	'jsfour-idcard/html/assets/images/male.png',
	'jsfour-idcard/html/assets/images/female.png',


	'jsfour-licenseplate/html/assets/images/plate.png',
	'jsfour-licenseplate/html/index.html',
	'jsfour-licenseplate/html/assets/fonts/roboto/Roboto-Bold.woff',
	'jsfour-licenseplate/html/assets/css/style.css',
	'jsfour-licenseplate/html/assets/js/jquery.js',
	'jsfour-licenseplate/html/assets/js/init.js',


}




