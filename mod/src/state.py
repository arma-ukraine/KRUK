import json
import typing as t
import pathlib


def _get_path(location: str):
    path = pathlib.Path("state") / f"{location}.json"
    path.parent.mkdir(parents=True, exist_ok=True)
    return path


def save(location: str, data: t.List):
    with open(
        _get_path(location),
        encoding="utf-8",
        mode="w+",
    ) as fh:
        json.dump({"data": data}, fh)


def load(location: str) -> t.List:
    try:
        with open(
            _get_path(location),
            encoding="utf-8",
        ) as fh:
            result = json.load(fh)["data"]
            return result if result else None
    except (json.JSONDecodeError, FileNotFoundError, KeyError):
        return None
