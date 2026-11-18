-- Ievieto recenzēšanas informāciju šķirkļa sākumā
local function str(x)
  if x == nil then return nil end
  return pandoc.utils.stringify(x)
end

function Pandoc(doc)
  local m = doc.meta
  local statuss = str(m["recenzijas-statuss"])
  if statuss == nil then return doc end
  local sag = str(m["sagatavoja"]) or "nav norādīts"
  local rindas = {}
  table.insert(rindas, "**Sagatavoja:** " .. sag)
  local rec = m["recenzenti"]
  if rec and #rec > 0 then
    local v = {}
    for _, r in ipairs(rec) do
      local s = str(r["vards"]) or ""
      if r["afiliacija"] then s = s .. " (" .. str(r["afiliacija"]) .. ")" end
      if r["datums"] then s = s .. ", " .. str(r["datums"]) end
      table.insert(v, s)
    end
    table.insert(rindas, "**Recenzēja:** " .. table.concat(v, "; "))
  end
  local teksts
  if statuss == "Recenzēts" then
    teksts = "**Statuss:** recenzēts. Šķirkli ir pārskatījis vismaz viens neatkarīgs speciālists."
  else
    teksts = "**Statuss:** melnraksts. Šķirkli vēl nav pārskatījis neatkarīgs recenzents. [Kā kļūt par recenzentu](../par-celvedi.qmd#recenzesana)."
  end
  table.insert(rindas, teksts)
  local md = table.concat(rindas, "  \n")
  local cls = statuss == "Recenzēts" and "recenzija recenzets" or "recenzija melnraksts"
  local div = pandoc.Div(pandoc.read(md, "markdown").blocks, pandoc.Attr("", {cls}))
  table.insert(doc.blocks, 1, div)
  return doc
end
