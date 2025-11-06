using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class VfxManager : MonoBehaviour
{
    // 单例实例，允许从其他脚本全局访问
    public static VfxManager instance;

    [Header("VFX Library")]
    [SerializeField] private ParticleSystem[] vfxLibrary; // 特效库数组，在Inspector中分配预制体

    [Header("Settings")]
    [SerializeField] private float vfxMinimumDistance = 10f; // 播放特效的最小距离

    private void Awake()
    {
        // 单例模式初始化，确保只有一个实例存在
        if (instance != null)
            Destroy(instance.gameObject); // 销毁重复的实例
        else
            instance = this; // 设置当前对象为单例实例

        // 可选：使对象在加载新场景时不被销毁
        // DontDestroyOnLoad(gameObject);
    }

    /// <summary>
    /// 通过索引在指定位置播放VFX特效
    /// </summary>
    /// <param name="_vfxIndex">特效在库中的索引</param>
    /// <param name="_position">世界空间中的播放位置</param>
    public void PlayVFX(int _vfxIndex, Vector3 _position)
    {
        // 安全检查：索引是否有效
        if (_vfxIndex < 0 || _vfxIndex >= vfxLibrary.Length)
        {
            Debug.LogWarning($"VFX索引 {_vfxIndex} 无效。特效库大小为 {vfxLibrary.Length}。");
            return;
        }

        // 距离检查：如果离玩家太远，则不播放以优化性能
        if (playerManager.instance != null && playerManager.instance.player != null)
        {
            float distanceToPlayer = Vector3.Distance(playerManager.instance.player.transform.position, _position);
            if (distanceToPlayer > vfxMinimumDistance)
                return;
        }

        // 从库中获取特效并实例化
        ParticleSystem vfxToPlay = vfxLibrary[_vfxIndex];
        if (vfxToPlay != null)
        {
            // 实例化并定位特效
            ParticleSystem newVFX = Instantiate(vfxToPlay, _position, Quaternion.identity);
            newVFX.Play(); // 播放特效

            // 可选：特效播放完毕后自动销毁
            Destroy(newVFX.gameObject, newVFX.main.duration + 1f); // 等待生命周期结束+1秒缓冲
        }
        else
        {
            Debug.LogWarning($"VFX库中索引为 {_vfxIndex} 的槽位为空。");
        }
    }

    /// <summary>
    /// 通过索引在指定位置和旋转播放VFX特效
    /// </summary>
    /// <param name="_vfxIndex">特效在库中的索引</param>
    /// <param name="_position">世界空间中的播放位置</param>
    /// <param name="_rotation">特效的旋转</param>
    public void PlayVFX(int _vfxIndex, Vector3 _position, Quaternion _rotation)
    {
        if (_vfxIndex < 0 || _vfxIndex >= vfxLibrary.Length)
        {
            Debug.LogWarning($"VFX索引 {_vfxIndex} 无效。特效库大小为 {vfxLibrary.Length}。");
            return;
        }

        if (playerManager.instance != null && playerManager.instance.player != null)
        {
            float distanceToPlayer = Vector3.Distance(playerManager.instance.player.transform.position, _position);
            if (distanceToPlayer > vfxMinimumDistance)
                return;
        }

        ParticleSystem vfxToPlay = vfxLibrary[_vfxIndex];
        if (vfxToPlay != null)
        {
            ParticleSystem newVFX = Instantiate(vfxToPlay, _position, _rotation);
            newVFX.Play();
            Destroy(newVFX.gameObject, newVFX.main.duration + 1f);
        }
        else
        {
            Debug.LogWarning($"VFX库中索引为 {_vfxIndex} 的槽位为空。");
        }
    }

    /// <summary>
    /// 停止所有正在播放的特定类型的VFX实例（需要更复杂的实现来跟踪实例）
    /// 基础版本：停止原预制体的播放（对已实例化的特效无效）
    /// </summary>
    /// <param name="_vfxIndex">要停止的特效索引</param>
    public void StopVFX(int _vfxIndex)
    {
        if (_vfxIndex < 0 || _vfxIndex >= vfxLibrary.Length)
        {
            Debug.LogWarning($"VFX索引 {_vfxIndex} 无效。");
            return;
        }

        // 注意：这只会停止库中原预制体的播放，不会影响已实例化的副本
        // 更完整的实现需要跟踪所有已生成的实例
        if (vfxLibrary[_vfxIndex] != null)
            vfxLibrary[_vfxIndex].Stop();
    }

    /// <summary>
    /// 在玩家位置播放特效（便捷方法）
    /// </summary>
    /// <param name="_vfxIndex">特效索引</param>
    public void PlayVFXOnPlayer(int _vfxIndex)
    {
        if (playerManager.instance != null && playerManager.instance.player != null)
        {
            PlayVFX(_vfxIndex, playerManager.instance.player.transform.position);
        }
        else
        {
            Debug.LogWarning("无法找到玩家实例。");
        }
    }
}
