labelName:=
githubAPI:= https://api.github.com/repos/avniproject
color:= $(if $(color),$(color),1d76db)

label = \
    curl -X POST $(githubAPI)/$(1)/labels \
    -H "Authorization: token $(token)" \
    -d '{"name":"$(labelName)","color":"$(color)"}' \

create_release_label:
ifndef labelName
	@echo "Please provide label name"
	exit 1
else
	make create_label token=$(GITHUB_TOKEN) labelName=$(labelName) color=$(color)
endif

create_label:
	$(call label,avni-product)
	$(call label,avni-client)
	$(call label,avni-server)
	$(call label,avni-webapp)
	$(call label,rules-config)
	$(call label,avni-models)
	$(call label,rules-server)
	$(call label,avni-canned-reports)
