-------------------------------  # C R O W N ---------------------------------
function login(username, password, checksave)
	if not (username == "") then
		if not (password == "") then
			local account = getAccount(username, password)
			if (account ~= false) then
				displayServerMessageLogin(source, "Logado com sucesso", "confirm")
				logIn(source, account, password)
				triggerClientEvent(source, "removeLogin", getRootElement())
				if checksave == true then
					triggerClientEvent(source, "saveLoginToXML", getRootElement(), username, password)
				else
					triggerClientEvent(source, "resetSaveXML", getRootElement(), username, password)
				end
			else
				displayServerMessageLogin(source, "Usuario ou senha incorretos", "warning")--Incorrect username or password
			end
		else
			displayServerMessageLogin(source, "Digite sua senha", "warning")---type your password
		end
	else
		displayServerMessageLogin(source, "Digite seu nome de usuario", "warning")--type username
	end
end
addEvent("login", true)
addEventHandler("login", getRootElement(), login)

function registrar(username, password)
	if not (username == "") then
		if not (password == "") then
			local account = getAccount(username, password)
			if (account == false) then
				local accountAdded = addAccount(tostring(username), tostring(password))
				if (accountAdded) then
					displayServerMessageLogin(source, "Login: "..username.."  |  Senha: "..password.."", "confirm")
				else
					displayServerMessageLogin(source, "Erro, tente novamente", "warning")--Error, please try again
				end
			else
				displayServerMessageLogin(source, "Este nome de usuario ja existe", "warning")--This username already exists
			end
		else
			displayServerMessageLogin(source, "Digite sua senha", "warning")--type your password
		end
	else
		displayServerMessageLogin(source, "Digite seu nome de usuario", "warning")--type username
	end
end
addEvent("registrar", true)
addEventHandler("registrar", getRootElement(), registrar)

function displayServerMessageLogin(source, message, type)
	triggerClientEvent(source, "servermessagesLogin", getRootElement(), message, type)
end
-------------------------------  # C R O W N ---------------------------------