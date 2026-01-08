using System.Collections;
using UnityEngine;

public class AudioManager : MonoBehaviour
{
    public static AudioManager instance;

    [SerializeField] private float sfxMinimumDistance;
    [SerializeField] private AudioSource[] sfx;
    [SerializeField] private AudioSource[] bgm;

    public bool playBgm;
    private int bgmIndex;

    private bool canPlaySFX;

    private void Awake()
    {
        if (instance != null)
            Destroy(instance);
        else
            instance = this;//this指当前类

        Invoke("AllowSFX", 1f);
    }

    private void Update()
    {
        if (!playBgm)
            StopAllBGM();
        else
        {
            if (!bgm[bgmIndex].isPlaying)
                PlayBgm(bgmIndex);
        }
    }

    public void PlaySFX(int _sfxIndex, Transform _source = null)
    {
        //if (sfx[_sfxIndex].isPlaying)
        //    return;

        if (canPlaySFX == false)
            return;

        if (_source != null && Vector2.Distance(playerManager.instance.player.transform.position, _source.position) > sfxMinimumDistance)
            return;

        if (_sfxIndex < sfx.Length)
        {
            sfx[_sfxIndex].pitch = Random.Range(.8f, 1.1f);
            sfx[_sfxIndex].Play();
        }
    }

    public void StopSFX(int _index) => sfx[_index].Stop();

    public void PlayBgm(int _bgmIndex)
    {
        bgmIndex = _bgmIndex;

        StopAllBGM();
        bgm[bgmIndex].Play();
    }

    public void StopSFXWithTime(int _index) => StartCoroutine(DecreaseVolume(sfx[_index], 1f));

    private IEnumerator DecreaseVolume(AudioSource _audio, float _duration)
    {
        float defaultVolume = _audio.volume;
        float timer = 0f;

        while (timer < _duration)
        {
            timer += Time.deltaTime;
            _audio.volume = Mathf.Lerp(defaultVolume, 0f, timer / _duration);
            yield return null; // 每帧更新

            if (_audio.volume <= .1f)
            {
                _audio.Stop();
                _audio.volume = defaultVolume; // 恢复原始音量以便下次使用
                break;
            }
        }
    }

    public void StopAllBGM()
    {
        for (int i = 0; i < bgm.Length; i++)
        {
            bgm[i].Stop(); 
        }
    }

    private void AllowSFX() => canPlaySFX = true;
}
