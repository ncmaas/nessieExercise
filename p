
[1mFrom:[0m /home/nick/exercise/app/controllers/transfers_controller.rb @ line 79 TransfersController#update:

    [1;34m66[0m: [32mdef[0m [1;34mupdate[0m
    [1;34m67[0m:   uri = URI([31m[1;31m"[0m[31mhttp://api.reimaginebanking.com/accounts/[1;31m"[0m[31m[0m + params[[33m:transfer[0m][[33m:payer_id[0m] + [31m[1;31m"[0m[31m/transfers?key=[1;31m"[0m[31m[0m + [1;34;4mRails[0m.application.secrets[[33m:nessie_api_key[0m])
    [1;34m68[0m:   [1;34m#req = Net::HTTP::Post.new(uri)[0m
    [1;34m69[0m:   those_params = {[31m[1;31m'[0m[31mmedium[1;31m'[0m[31m[0m => params[[33m:transfer[0m][[33m:medium[0m], [31m[1;31m'[0m[31mpayee_id[1;31m'[0m[31m[0m => params[[33m:transfer[0m][[33m:payee_id[0m], [31m[1;31m'[0m[31mamount[1;31m'[0m[31m[0m => params[[33m:transfer[0m][[33m:amount[0m].to_i}
    [1;34m70[0m: 
    [1;34m71[0m:   [1;34m#req.body=those_params.to_json[0m
    [1;34m72[0m:   [1;34m#res = Net::HTTP.start(uri.hostname,uri.port) do |http|[0m
    [1;34m73[0m:   [1;34m#  stuff=http.request(req)[0m
    [1;34m74[0m:   [1;34m#  binding.pry[0m
    [1;34m75[0m:   [1;34m#end[0m
    [1;34m76[0m: 
    [1;34m77[0m:   [1;34m#binding.pry[0m
    [1;34m78[0m:   resp = [1;34;4mNet[0m::[1;34;4mHTTP[0m.post_form(uri, those_params)
 => [1;34m79[0m:   binding.pry
    [1;34m80[0m:   respond_to [32mdo[0m |format|
    [1;34m81[0m:     [32mif[0m @transfer.update(transfer_params)
    [1;34m82[0m:       format.html { redirect_to @transfer, [35mnotice[0m: [31m[1;31m'[0m[31mTransfer was successfully updated.[1;31m'[0m[31m[0m }
    [1;34m83[0m:       format.json { render [33m:show[0m, [35mstatus[0m: [33m:ok[0m, [35mlocation[0m: @transfer }
    [1;34m84[0m:     [32melse[0m
    [1;34m85[0m:       format.html { render [33m:edit[0m }
    [1;34m86[0m:       format.json { render [35mjson[0m: @transfer.errors, [35mstatus[0m: [33m:unprocessable_entity[0m }
    [1;34m87[0m:     [32mend[0m
    [1;34m88[0m:   [32mend[0m
    [1;34m89[0m: [32mend[0m

