from src import state


def test_get_character():
    character = state.get_character("_TEST_")
    assert character.medic == 0
    assert character.uid == ("_TEST_")


def test_save_character():
    character = state.get_character("_TEST_")
    character.dir = 250
    character.save()
    character = state.get_character("_TEST_")
    assert character.dir == 250
    character.dir = 0
    character.save()
    character = state.get_character("_TEST_")
    assert character.dir == 0
