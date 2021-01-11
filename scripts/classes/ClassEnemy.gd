extends Area2D

export var life = 2
export var points = 10

var preExplosion = preload("res://scenes/Explosion.tscn")

func _ready():
    add_to_group(Game.GROUP_ENEMY)
    _inicia()
    pass

func _inicia():
    pass

func setDamage(damage):
    _takeDamage()
    life -= damage
    if life <= 0 :
        _destroy()
        get_node("timer").start()
        var explosion = preExplosion.instance()
        add_child(explosion)
        remove_from_group(Game.GROUP_ENEMY)
        set_process(false)
        z_index = 10
        Game.getCamera().activeShake()
    pass

func setPoints():
    Game.score += points
    pass

func _takeDamage() :
    pass

func _destroy() :
    pass