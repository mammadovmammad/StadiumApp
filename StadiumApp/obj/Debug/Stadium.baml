   M S B A M L   `   `   `  ����E  AStadiumApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:StadiumApp
StadiumApp  5   	       StadiumApp.Stadium   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:StadiumApp     5   	     � Title$  Stadion��5   	   $��438.404��6   $��1433.224��6*    � WindowStartupLocation$ CenterScreen=�6;    � 
ResizeMode$ NoResize=�6`    � WindowState$ 	Maximized=�6v   .��5	      � ��5
   
   �� 5       �� ImageSource$ /Image/Stadium.jpg��6    j� Stretch$ UniformToFill=�6:   .+�5   
   �� $��Tarix seçin��6   $
��Left=�6&   $��
178,42,0,0q�6A   $	��128��6U   $��29��6a   $	��Top=�6m   $��Center=�6�   
�������6�   (  "System.Windows.Controls.DatePicker  5   
   -   5          Name$ dtpPlayTime��5      $��
178,71,0,0q�6*   $	��202��6>   $	��Top=�6J   $��Stretch=�6b   $
��Left=�6�   $��26��6�   �� 5   
   -   5         ��Name$ 
lblStadium��5      $��Stadion seçin��6$   $y�Hidden=�6<   $
��Left=�6P   $��178,180,0,0q�6k   $��87��6�   $	��Top=�6�   $��Center=�6�   
�������$��30��6�   �� 5   
   -   5         ��Name$ cmbStadiums��5      $y�Hidden=�6(   $
��Left=�6<   $��178,209,0,0q�6W   $	��202��6l   $	��Top=�6x   $��Center=�6�   $��26��6�   6�   �� 5   
   $��Saat seçin��6   $
��Left=�6&   $��178,108,0,0q�6A   $	��Top=�6V   $��Center=�6n   
�������$��28��6�   $��66��6�   �� 5   
   -   5        $ cmbHours��5      $
��Left=�6%   $��178,136,0,0q�6@   $	��202��6U   $	��Top=�6a   $��Center=�6y   $��25��6�   �� 5   
   -   5        $ 
lblContact��5      $��Şəxs seçin��6$   $y�Hidden=�69   $
��Left=�6M   $��178,250,0,0q�6h   $	��Top=�6}   
�������$��28��6�   $��66��6�   �� 5   
   -   5        $ cmbContacts��5      $y�Hidden=�6(   $
��Left=�6<   $��178,278,0,0q�6W   $	��Top=�6l   $	��202��6�   $��26��6�   6�   �� 5   
   -   5        	 ��Name$	 btnAddContact��5      $y�Hidden=�6(   $��
Əlavə et��6<   $
��Left=�6O   $��386,278,0,0q�6j   $	��Top=�6   $��57��6�   $��26��6�   6�   &   System.Windows.Controls.DataGrid  5   
   -   5        
  Name$
 	dgBooking��5      $
��Left=�6M   $	��233��6h   $��574,114,0,0q�6u   $	��Top=�6�   $	��620��6�    J� RenderTransformOrigin$ 0.492,0.774&�6�      AutoGenerateColumns . ��6&   ��  �� Path$ 	VwBooking�   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Id��6<      
Visibility$ Hidden=�6H   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   �� *Id+6H     5      $ Tarix��6>    6%   �� *Date+6>     5      $
 Saat��6>    6%   �� *Hour+6>     5      $ Stadion��6A    6%   �� *	Stadium+6A     5      $ Şəxs��6A    6%   �� *	Contact+6A   5      �� 5   
   -	   5        $	 BtnAddStadium��5      $y�Hidden=�6(   $��
Əlavə et��6<   $
��Left=�6O   $��386,209,0,0q�6j   $	��Top=�6   $��57��6�   $��26��6�   6�   �� 5    
   -
   5        $	 
btnBooking��5       $y�Hidden=�6%   $��	Rezerv et��69   $
��Left=�6M   $��178,309,0,0q�6h   $	��Top=�6}   $	��202��6�   $��38��6�   6�   �� 5!   
   -   5        $	 btnUpdateDeleteStadium��5!      $y�Hidden=�61   $��Yenilə/Sil��6E   $
��Left=�6Z   $��448,209,0,0q�6u   $	��Top=�6�   $��61��6�   $��26��6�   �� 5"   
   -   5        $	 btnUpdateDeleteContact��5"      $y�Hidden=�61   $��Yenilə/Sil��6E   $
��Left=�6Z   $��448,278,0,0q�6u   $	��Top=�6�   $��61��6�   $��26��6�   �� 5#   
   -   5        $ cmbSearchHour��5#      $
��Left=�6*   $��
803,71,0,0q�6E   $	��Top=�6Y   $	��120��6q   $��22��6}   �� 5$   
   -   5        $ cmbSearchStadium��5$      $
��Left=�6-   $��
949,71,0,0q�6H   $	��Top=�6\   $	��120��6t    �� DisplayMemberPath$
 Name��5&       �� SelectedValuePath$ Id��5'      ��5%      �� $ Stadiums� �� SelectedValue 5(      �� $ Stadiums�  5*   
   -   5        $ dtpSearchDate��5*      $
��Left=�6,   $��
574,71,0,0q�6G   $	��Top=�6[   $��22��6s   $	��181��6   �� 5+   
   -   5        $	 	btnSearch��5+      $��Axtar��6$   $
��Left=�64   $��1098,71,0,0q�6O   $	��Top=�6d   $��96��6|   $��22��6�   6�   �� 5,   
   $��Saat seçin��6   $
��Left=�6%   $��
803,44,0,0q�6@   $	��Top=�6T   $	��120��6l   
�������6x   �� 5-   
   $��Stadion seçin��6   $
��Left=�6(   $��
949,44,0,0q�6C   $	��Top=�6W   $	��120��6o   
�������6{   �� 5.   
   $��	Qeydiyyat��6   $
��Left=�6$   $��	192,5,0,0q�6?   $	��Top=�6R   $	��114��6j   
�������$��20(�6�   �� 5/   
   $��	Axtarış��6   $
��Left=�6"   $��	651,5,0,0q�6=   $	��Top=�6P   $��86��6h   
�������$��20(�6�   $ 
1.46,0.897&�6�   �� 50   
   -   5        $	 btnMonthlyResult��50      $��Hesabat��6+   $
��Left=�6=   $��580,367,0,0q�6X   $	��Top=�6m   $��75��6�   6�   �� 51   
   -   5        $ lblMonthlyPrice��51      $�� ��6)   $
��Left=�64   $��739,364,0,0q�6O   $	��Top=�6d   $��65��6|   
�������6�   �� 52   
   $��Aylıq gəlir:��6   $
��Left=�6'   $��674,364,0,0q�6B   $	��Top=�6W   $��81��6o   
�������6z   �� 53   
   -   5        $	 btnUpdateShortCut��53      $��Yenilə��6,   $y�Hidden=�6=   $
��Left=�6Q   $��386,278,0,0q�6l   $	��Top=�6�   $��57��6�   $��26��6�   54      55      