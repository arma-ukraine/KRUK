import toml
from . import settings

project_toml = toml.load(".hemtt/project.toml")
rows = ""
for identifier in project_toml["hemtt"]["launch"]["workshop"] + [settings.MOD_ID]:
    rows += f"""
      <tr data-type="ModContainer">
        <td data-type="DisplayName"></td>
        <td></td>
        <td>
          <a href="https://steamcommunity.com/sharedfiles/filedetails/?id={identifier}"
            data-type="Link">https://steamcommunity.com/sharedfiles/filedetails/?id={identifier}</a>
        </td>
      </tr>"""

result = f"""<?xml version="1.0" encoding="utf-8"?>
<html>

<head>
  <meta name="arma:Type" content="preset" />
  <meta name="arma:PresetName" content="{project_toml["name"]}" />
  <title>Arma 3</title>
</head>

<body>
  <div class="mod-list">
    <table>
      {rows}
    </table>
  </div>
  <div class="dlc-list">
    <table />
  </div>
</body>

</html>
"""

with open("preset.html", "w") as f:
    f.write(result)
