using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BackgroundLayer1 : MonoBehaviour
{
    [Header("渲染设置")]
    public int renderQueueOffset = 0;
    public bool applyOnStart = true;

    private Material materialInstance;
    void Start()
    {
        if (applyOnStart)
        {
            ApplyRenderQueueSettings();
        }
    }
    public void ApplyRenderQueueSettings()
    {
        Renderer renderer = GetComponent<Renderer>();
        if (renderer == null)
        {
            Debug.LogError($"在物体 {gameObject.name} 上找不到Renderer组件");
            return;
        }

        // 确保使用材质实例而不是共享材质
        materialInstance = renderer.material;

        // 设置渲染队列
        // 2000是不透明物体的基础队列，数值越小越先渲染（在更后面）
        materialInstance.renderQueue = 2000 + renderQueueOffset;

        Debug.Log($"设置 {gameObject.name} 的渲染队列为: {materialInstance.renderQueue}");
    }
    // Update is called once per frame
    void OnValidate()
    {
        if (materialInstance != null && Application.isPlaying)
        {
            materialInstance.renderQueue = 2000 + renderQueueOffset;
        }
    }
    void OnDestroy()
    {
        // 清理材质实例
        if (materialInstance != null)
        {
            DestroyImmediate(materialInstance);
        }
    }
    void Update()
    {
        
    }
}
