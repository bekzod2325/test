<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "product".
 *
 * @property int $id
 * @property string $category_id
 * @property string $name
 * @property string $content
 * @property double $price
 * @property string $keywords
 * @property string $description
 * @property string $img
 * @property string $hit
 * @property string $new
 * @property string $sale
 */
class Product extends \yii\db\ActiveRecord
{
    public $image;
    public $gallery;

    public function behaviors()
    {
        return[
            'image' => [
                'class' => 'rico\yii2images\behaviors\ImageBehave',
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product';
    }

    public function getCategory()
    {
        return $this->hasOne( Category::className(), ['id' => 'category_id'] );
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['category_id', 'name', 'price', 'hit', 'new', 'sale'], 'required'],
            [['category_id'], 'integer'],
            [['content', 'hit', 'new', 'sale'], 'string'],
            [['price'], 'number'],
            [['name', 'keywords', 'description', 'img'], 'string', 'max' => 255],
            [['image'], 'file', 'extensions' => 'jpg, png'],
            // [['gallery'], 'file', 'maxFile' => 4],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Tovar T/R',
            'category_id' => 'Kategoriya nomi',
            'name' => 'Nomi',
            'content' => 'Kontent',
            'price' => 'Narx',
            'keywords' => 'Kalit so`z',
            'description' => 'Izox',
            'image' => 'Foto',
            'hit' => 'Hit',
            'new' => 'Yangi',
            'sale' => 'Aksiya',
        ];
    }

    public function upload()
    {
        if ( $this->validate() ) {
            $path = 'upload/store/' . $this->image->baseName.'.'.$this->image->extension;
            $this->image->saveAs($path);
            // $this->attachImage($path);
            return true;
        }else{
            return false;
        }
    }
}
