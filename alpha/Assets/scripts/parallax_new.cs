using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class parallax_new : MonoBehaviour
{
    // Start is called before the first frame update
    private GameObject cam;
    public float parallaxEffect;
    private float xPosition;
    private float length;
    void Start()
    {
        cam = GameObject.Find("Main Camera");
        length = GetComponent<MeshRenderer>().bounds.size.x;
        xPosition = transform.position.x;
    }

    // Update is called once per frame
    void LateUpdate()
    {
        float distanceToMove = cam.transform.position.x * parallaxEffect;
        float distanceMoved = cam.transform.position.x * (1 - parallaxEffect);
        transform.position = new Vector3(xPosition + distanceToMove, transform.position.y, transform.position.z);
        if(distanceMoved>xPosition+length)
            xPosition = xPosition + length;
        else if(distanceMoved<xPosition-length)
            xPosition =xPosition - length;
    }
}
