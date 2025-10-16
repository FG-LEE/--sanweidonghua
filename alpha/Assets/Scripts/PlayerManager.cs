using UnityEngine;

public class playerManager : MonoBehaviour
{
    public static playerManager instance;//单例模式,单例，即只有一个实例的方法，并且有一个可全局访问的访问点
    public Player player;

    public int currency;

    private void Awake()
    {
        if (instance != null)
            Destroy(instance);
        else
            instance = this;//this指当前类
    }

}
