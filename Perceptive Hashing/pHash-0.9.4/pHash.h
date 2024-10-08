/*

    pHash, the open source perceptual hash library
    Copyright (C) 2008-2009 Aetilius, Inc.
    All rights reserved.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

    Evan Klinger - eklinger@phash.org
    D Grant Starkweather - dstarkweather@phash.org

*/

#ifndef _PHASH_H
#define _PHASH_H


#ifndef _WIN32
#include <pHash-config.h>
#include <unistd.h>
#include <sys/mman.h>
#include <stdint.h>
#endif

#include <limits.h>
#include <math.h>
#include "dirent.h"
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#define __STDC_CONSTANT_MACROS


#if defined(HAVE_IMAGE_HASH) || defined(HAVE_VIDEO_HASH)
#define cimg_debug 0
#define cimg_display 0
#include "CImg.h"
using namespace cimg_library;
#endif

#ifdef HAVE_PTHREAD
#include <pthread.h>
#endif

#if !defined(__GLIBC__) && !defined(_WIN32)
#include <sys/param.h>
#include <sys/sysctl.h>
#endif

using namespace std;

#define SQRT_TWO 1.4142135623730950488016887242097

#ifndef ULLONG_MAX
#define ULLONG_MAX 18446744073709551615ULL
#endif

#define ROUNDING_FACTOR(x) (((x) >= 0) ? 0.5 : -0.5) 

#ifndef _WIN32
typedef unsigned _uint64 ulong64;
typedef signed _int64 long64;
#else
typedef unsigned long long ulong64;
typedef signed long long long64;
typedef unsigned char uint8_t;
typedef unsigned int uint32_t;
#endif

#ifdef __cplusplus
extern "C" {
#endif

const int MaxFileSize = (1<<30); /* 1GB file size limit (for mvp files) */
const off_t HeaderSize = 64;     /* header size for mvp file */


typedef struct ph_file_offset {
    off_t offset;
    uint8_t fileno;
} FileIndex;


/* structure for a single hash */
typedef struct ph_datapoint {
    char *id;
    void *hash;
    float *path;
    uint32_t hash_length;
    uint8_t hash_type;
}DP;

typedef struct ph_slice {
    DP **hash_p;
    int n;
    void *hash_params;
} slice;



struct BinHash 
{
	uint8_t *hash;
	uint32_t bytelength;
	uint32_t byteidx; // used by addbit()
	uint8_t bitmask;  // used by addbit()

	/*
	 * add a single bit to hash. the bits are 
	 * written from left to right.
	 */
	int addbit(uint8_t bit)
	{
		if (bitmask == 0) 
		{
			bitmask = 128; // reset bitmask to "10000000"
			byteidx++;     // jump to next byte in array
		}

		if (byteidx >= bytelength) return -1;
		
		if (bit == 1) *(hash + byteidx) |= bitmask;
		bitmask >>=1;
		return 0;
	}	
};

BinHash* _ph_bmb_new(uint32_t bytelength);
void ph_bmb_free(BinHash *binHash);

/*! /brief Radon Projection info
 */
#ifdef HAVE_IMAGE_HASH
typedef struct ph_projections {
    CImg<uint8_t> *R;           //contains projections of image of angled lines through center
    int *nb_pix_perline;        //the head of int array denoting the number of pixels of each line
    int size;                   //the size of nb_pix_perline
}Projections;
#endif

/*! /brief feature vector info
 */
typedef struct ph_feature_vector {
    double *features;           //the head of the feature array of double's
    int size;                   //the size of the feature array
}Features;

/*! /brief Digest info
 */
typedef struct ph_digest {
    char *id;                   //hash id
    uint8_t *coeffs;            //the head of the digest integer coefficient array
    int size;                   //the size of the coeff array
} Digest;

__declspec(dllexport) int ph_dct_imagehash(const char* file,ulong64 &hash);

/* variables for textual hash */
const int KgramLength = 50;
const int WindowLength = 100;
const int delta = 1;

#define ROTATELEFT(x, bits)  (((x)<<(bits)) | ((x)>>(64-bits)))

typedef struct ph_hash_point {
    ulong64 hash;
    off_t index; /*pos of hash in orig file */
} TxtHashPoint;

typedef struct ph_match{
    off_t first_index; /* offset into first file */
    off_t second_index; /* offset into second file */
    uint32_t length;    /*length of match between 2 files */
} TxtMatch;

#ifdef HAVE_PTHREAD
int ph_num_threads();
#endif

/* /brief alloc a single data point
 *  allocates path array, does nto set id or path
 */
 DP* ph_malloc_datapoint(int hashtype);

/** /brief free a datapoint and its path
 *
 */
void ph_free_datapoint(DP *dp);

/*! /brief copyright information
 */
const char* ph_about();

/*! /brief radon function
 *  Find radon projections of N lines running through the image center for lines angled 0
 *  to 180 degrees from horizontal.
 *  /param img - CImg src image
 *  /param  N  - int number of angled lines to consider.
 *  /param  projs - (out) Projections struct 
 *  /return int value - less than 0 for error
 */
#ifdef HAVE_IMAGE_HASH
int ph_radon_projections(const CImg<uint8_t> &img,int N,Projections &projs);

/*! /brief feature vector
 *         compute the feature vector from a radon projection map.
 *  /param  projs - Projections struct
 *  /param  fv    - (out) Features struct
 *  /return int value - less than 0 for error
*/
int ph_feature_vector(const Projections &projs,Features &fv);

/*! /brief dct 
 *  Compute the dct of a given vector
 *  /param R - vector of input series
 *  /param D - (out) the dct of R
 *  /return  int value - less than 0 for error
*/
int ph_dct(const Features &fv, Digest &digest);

/*! /brief cross correlation for 2 series
 *  Compute the cross correlation of two series vectors
 *  /param x - Digest struct
 *  /param y - Digest struct
 *  /param pcc - double value the peak of cross correlation
 *  /param threshold - double value for the threshold value for which 2 images
 *                     are considered the same or different.
 *  /return - int value - 1 (true) for same, 0 (false) for different, < 0 for error
 */

int ph_crosscorr(const Digest &x,const Digest &y,double &pcc, double threshold = 0.90);

/*! /brief image digest
 *  Compute the image digest for an image given the input image
 *  /param img - CImg object representing an input image
 *  /param sigma - double value for the deviation for a gaussian filter function 
 *  /param gamma - double value for gamma correction on the input image
 *  /param digest - (out) Digest struct
 *  /param N      - int value for the number of angles to consider. 
 *  /return       - less than 0 for error
 */
int _ph_image_digest(const CImg<uint8_t> &img,double sigma, double gamma,Digest &digest,int N=180);

/*! /brief image digest
 *  Compute the image digest given the file name.
 *  /param file - string value for file name of input image.
 *  /param sigma - double value for the deviation for gaussian filter
 *  /param gamma - double value for gamma correction on the input image.
 *  /param digest - Digest struct
 *  /param N      - int value for number of angles to consider
 */
int ph_image_digest(const char *file, double sigma, double gamma, Digest &digest,int N=180);


/*! /brief compare 2 images
 *  /param imA - CImg object of first image 
 *  /param imB - CImg object of second image
 *  /param pcc   - (out) double value for peak of cross correlation
 *  /param sigma - double value for the deviation of gaussian filter
 *  /param gamma - double value for gamma correction of images
 *  /param N     - int number for the number of angles of radon projections
 *  /param theshold - double value for the threshold
 *  /return int 0 (false) for different images, 1 (true) for same image, less than 0 for error
 */
int _ph_compare_images(const CImg<uint8_t> &imA,const CImg<uint8_t> &imB,double &pcc, double sigma = 3.5, double gamma = 1.0,int N=180,double threshold=0.90);

/*! /brief compare 2 images
 *  Compare 2 images given the file names
 *  /param file1 - char string of first image file
 *  /param file2 - char string of second image file
 *  /param pcc   - (out) double value for peak of cross correlation
 *  /param sigma - double value for deviation of gaussian filter
 *  /param gamma - double value for gamma correction of images
 *  /param N     - int number for number of angles
 *  /return int 0 (false) for different image, 1 (true) for same images, less than 0 for error
 */
int ph_compare_images(const char *file1, const char *file2,double &pcc, double sigma = 3.5, double gamma=1.0, int N=180,double threshold=0.90);

/*! /brief return dct matrix, C
 *  Return DCT matrix of sqare size, N
 *  /param N - int denoting the size of the square matrix to create.
 *  /return CImg<double> size NxN containing the dct matrix
 */
static CImg<float>* ph_dct_matrix(const int N);

/*! /brief compute dct robust image hash
 *  /param file string variable for name of file
 *  /param hash of type ulong64 (must be 64-bit variable)
 *  /return int value - -1 for failure, 1 for success
 */
int ph_dct_imagehash(const char* file,ulong64 &hash);

int ph_bmb_imagehash(const char *file, uint8_t method, BinHash **ret_hash);
#endif

#ifdef HAVE_PTHREAD
DP** ph_dct_image_hashes(char *files[], int count, int threads = 0);
#endif

#ifdef HAVE_VIDEO_HASH
static CImgList<uint8_t>* ph_getKeyFramesFromVideo(const char *filename);

ulong64* ph_dct_videohash(const char *filename, int &Length);

DP** ph_dct_video_hashes(char *files[], int count, int threads = 0);

double ph_dct_videohash_dist(ulong64 *hashA, int N1, ulong64 *hashB, int N2, int threshold=21);
#endif

/* ! /brief dct video robust hash
 *   Compute video hash based on the dct of normalized video 32x32x64 cube
 *   /param file name of file
 *   /param hash ulong64 value for hash value
 *   /return int value - less than 0 for error
 */
#ifdef HAVE_IMAGE_HASH
__declspec(dllexport) int ph_hamming_distance(const ulong64 hash1,const ulong64 hash2);

/** /brief create a list of datapoint's directly from a directory of image files
 *  /param dirname - path and name of directory containg all image file names
 *  /param capacity - int value for upper limit on number of hashes
 *  /param count - number of hashes created (out param)
 *  /return pointer to a list of DP pointers (NULL for error)
 */

DP** ph_read_imagehashes(const char *dirname,int capacity, int &count);

/** /brief create MH image hash for filename image
*   /param filename - string name of image file
*   /param N - (out) int value for length of image hash returned
*   /param alpha - int scale factor for marr wavelet (default=2)
*   /param lvl   - int level of scale factor (default = 1)
*   /return uint8_t array
**/
uint8_t* ph_mh_imagehash(const char *filename, int &N, float alpha=2.0f, float lvl = 1.0f);
#endif
/** /brief count number bits set in given byte
*   /param val - uint8_t byte value
*   /return int value for number of bits set
**/
int ph_bitcount8(uint8_t val);

/** /brief compute hamming distance between two byte arrays
 *  /param hashA - byte array for first hash
 *  /param lenA - int length of hashA 
 *  /param hashB - byte array for second hash
 *  /param lenB - int length of hashB
 *  /return double value for normalized hamming distance
 **/
double ph_hammingdistance2(uint8_t *hashA, int lenA, uint8_t *hashB, int lenB);

/** /brief get all the filenames in specified directory
 *  /param dirname - string value for path and filename
 *  /param cap - int value for upper limit to number of files
 *  /param count - int value for number of file names returned
 *  /return array of pointers to string file names (NULL for error)
 **/

char** ph_readfilenames(const char *dirname,int &count);


/** /brief textual hash for file
 *  /param filename - char* name of file
 *  /param nbpoints - int length of array of return value (out)
 *  /return TxtHashPoint* array of hash points with respective index into file.
 **/
TxtHashPoint* ph_texthash(const char *filename, int *nbpoints);

/** /brief compare 2 text hashes
 *  /param hash1 -TxtHashPoint
 *  /param N1 - int length of hash1
 *  /param hash2 - TxtHashPoint
 *  /param N2 - int length of hash2
 *  /param nbmatches - int number of matches found (out)
 *  /return TxtMatch* - list of all matches
 **/
TxtMatch* ph_compare_text_hashes(TxtHashPoint *hash1, int N1, TxtHashPoint *hash2, int N2, int *nbmatches);

/* random char mapping for textual hash */

static const ulong64 textkeys[256] = {
    15498727785010036736ULL,
    7275080914684608512ULL,
    14445630958268841984ULL,
    14728618948878663680ULL,
    16816925489502355456ULL,
    3644179549068984320ULL,
    6183768379476672512ULL,
    14171334718745739264ULL,
    5124038997949022208ULL,
    10218941994323935232ULL,
    8806421233143906304ULL,
    11600620999078313984ULL,
    6729085808520724480ULL,
    9470575193177980928ULL,
    17565538031497117696ULL,
    16900815933189128192ULL,
    11726811544871239680ULL,
    13231792875940872192ULL,
    2612106097615437824ULL,
    11196599515807219712ULL,
    300692472869158912ULL,
    4480470094610169856ULL,
    2531475774624497664ULL,
    14834442768343891968ULL,
    2890219059826130944ULL,
    7396118625003765760ULL,
    2394211153875042304ULL,
    2007168123001634816ULL,
    18426904923984625664ULL,
    4026129272715345920ULL,
    9461932602286931968ULL,
    15478888635285110784ULL,
    11301210195989889024ULL,
    5460819486846222336ULL,
    11760763510454222848ULL,
    9671391611782692864ULL,
    9104999035915206656ULL,
    17944531898520829952ULL,
    5395982256818880512ULL,
    14229038033864228864ULL,
    9716729819135213568ULL,
    14202403489962786816ULL,
    7382914959232991232ULL,
    16445815627655938048ULL,
    5226234609431216128ULL,
    6501708925610491904ULL,
    14899887495725449216ULL,
    16953046154302455808ULL,
    1286757727841812480ULL,
    17511993593340887040ULL,
    9702901604990058496ULL,
    1587450200710971392ULL,
    3545719622831439872ULL,
    12234377379614556160ULL,
    16421892977644797952ULL,
    6435938682657570816ULL,
    1183751930908770304ULL,
    369360057810288640ULL,
    8443106805659205632ULL,
    1163912781183844352ULL,
    4395489330525634560ULL,
    17905039407946137600ULL,
    16642801425058889728ULL,
    15696699526515523584ULL,
    4919114829672742912ULL,
    9956820861803560960ULL,
    6921347064588664832ULL,
    14024113865587949568ULL,
    9454608686614839296ULL,
    12317329321407545344ULL,
    9806407834332561408ULL,
    724594440630435840ULL,
    8072988737660780544ULL,
    17189322793565552640ULL,
    17170410068286373888ULL,
    13299223355681931264ULL,
    5244287645466492928ULL,
    13623553490302271488ULL,
    11805525436274835456ULL,
    6531045381898240000ULL,
    12688803018523541504ULL,
    3061682967555342336ULL,
    8118495582609211392ULL,
    16234522641354981376ULL,
    15296060347169898496ULL,
    6093644486544457728ULL,
    4223717250303000576ULL,
    16479812286668603392ULL,
    6463004544354746368ULL,
    12666824055962206208ULL,
    17643725067852447744ULL,
    10858493883470315520ULL,
    12125119390198792192ULL,
    15839782419201785856ULL,
    8108449336276287488ULL,
    17044234219871535104ULL,
    7349859215885729792ULL,
    15029796409454886912ULL,
    12621604020339867648ULL,
    16804467902500569088ULL,
    8900381657152880640ULL,
    3981267780962877440ULL,
    17529062343131004928ULL,
    16973370403403595776ULL,
    2723846500818878464ULL,
    16252728346297761792ULL,
    11825849685375975424ULL,
    7968134154875305984ULL,
    11429537762890481664ULL,
    5184631047941259264ULL,
    14499179536773545984ULL,
    5671596707704471552ULL,
    8246314024086536192ULL,
    4170931045673205760ULL,
    3459375275349901312ULL,
    5095630297546883072ULL,
    10264575540807598080ULL,
    7683092525652901888ULL,
    3128698510505934848ULL,
    16727580085162344448ULL,
    1903172507905556480ULL,
    2325679513238765568ULL,
    9139329894923108352ULL,
    14028291906694283264ULL,
    18165461932440551424ULL,
    17247779239789330432ULL,
    12625782052856266752ULL,
    7068577074616729600ULL,
    13830831575534665728ULL,
    6800641999486582784ULL,
    5426300911997681664ULL,
    4284469158977994752ULL,
    10781909780449460224ULL,
    4508619181419134976ULL,
    2811095488672038912ULL,
    13505756289858273280ULL,
    2314603454007345152ULL,
    14636945174048014336ULL,
    3027146371024027648ULL,
    13744141225487761408ULL,
    1374832156869656576ULL,
    17526325907797573632ULL,
    968993859482681344ULL,
    9621146180956192768ULL,
    3250512879761227776ULL,
    4428369143422517248ULL,
    14716776478503075840ULL,
    13515088420568825856ULL,
    12111461669075419136ULL,
    17845474997598945280ULL,
    11795924440611553280ULL,
    14014634185570910208ULL,
    1724410437128159232ULL,
    2488510261825110016ULL,
    9596182018555641856ULL,
    1443128295859159040ULL,
    1289545427904888832ULL,
    3775219997702356992ULL,
    8511705379065823232ULL,
    15120377003439554560ULL,
    10575862005778874368ULL,
    13938006291063504896ULL,
    958102097297932288ULL,
    2911027712518782976ULL,
    18446625472482639872ULL,
    3769197585969971200ULL,
    16416784002377056256ULL,
    2314484861370368000ULL,
    18406142768607920128ULL,
    997186299691532288ULL,
    16058626086858129408ULL,
    1334230851768025088ULL,
    76768133779554304ULL,
    17027619946340810752ULL,
    10955377032724217856ULL,
    3327281022130716672ULL,
    3009245016053776384ULL,
    7225409437517742080ULL,
    16842369442699542528ULL,
    15120706693719130112ULL,
    6624140361407135744ULL,
    10191549809601544192ULL,
    10688596805580488704ULL,
    8348550798535294976ULL,
    12680060080016588800ULL,
    1838034750426578944ULL,
    9791679102984388608ULL,
    13969605507921477632ULL,
    5613254748128935936ULL,
    18303384482050211840ULL,
    10643238446241415168ULL,
    16189116753907810304ULL,
    13794646699404165120ULL,
    11601340543539347456ULL,
    653400401306976256ULL,
    13794528098177253376ULL,
    15370538129509318656ULL,
    17070184403684032512ULL,
    16109012959547621376ULL,
    15329936824407687168ULL,
    18067370711965499392ULL,
    13720894972696199168ULL,
    16664167676175712256ULL,
    18144138845745053696ULL,
    12301770853917392896ULL,
    9172800635190378496ULL,
    3024675794166218752ULL,
    15311015869971169280ULL,
    16398210081298055168ULL,
    1420301171746144256ULL,
    11984978489980747776ULL,
    4575606368995639296ULL,
    11611850981347688448ULL,
    4226831221851684864ULL,
    12924157176120868864ULL,
    5845166987654725632ULL,
    6064865972278263808ULL,
    4269092205395705856ULL,
    1368028430456586240ULL,
    11678120728997134336ULL,
    4125732613736366080ULL,
    12011266876698001408ULL,
    9420493409195393024ULL,
    17920379313140531200ULL,
    5165863346527797248ULL,
    10073893810502369280ULL,
    13268163337608232960ULL,
    2089657402327564288ULL,
    8697334149066784768ULL,
    10930432232036237312ULL,
    17419594235325186048ULL,
    8317960787322732544ULL,
    6204583131022884864ULL,
    15637017837791346688ULL,
    8015355559358234624ULL,
    59609911230726144ULL,
    6363074407862108160ULL,
    11040031362114387968ULL,
    15370625789791830016ULL,
    4314540415450611712ULL,
    12460332533860532224ULL,
    8908860206063026176ULL,
    8890146784446251008ULL,
    5625439441498669056ULL,
    13135691436504645632ULL,
    3367559886857568256ULL,
    11470606437743329280ULL,
    753813335073357824ULL,
    7636652092253274112ULL,
    12838634868199915520ULL,
    12431934064070492160ULL,
    11762384705989640192ULL,
    6403157671188365312ULL,
    3405683408146268160ULL,
    11236019945420619776ULL,
    11569021017716162560ULL
};

#ifdef __cplusplus
}
#endif

#endif
